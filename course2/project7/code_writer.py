import os

from command_parser import CommandType


class CodeWriter:
    def __init__(self, filename):
        self.filename = filename
        self.f = open(self.filename, "w")
        self.label_counter = 0

    def _load_ptr_into_stack(self, var_name="addr"):
        self.output += f"// *SP = *{var_name}\n"

        # D = *addr
        self.output += f"// D = *{var_name}\n"
        self.output += f"@{var_name}\n"
        self._load_register_into_register(dest="A", src="M")
        self._load_register_into_register(dest="D", src="M")

        # *SP = D
        self._load_d_into_stack_ptr()

    def _load_stack_value_into_ptr(self, var_name="addr"):
        self.output += f"// *{var_name} = *SP\n"

        # D = *SP
        self._load_stack_ptr_value_into_d()

        # *addr = D
        self.output += f"// *{var_name} = D\n"
        self.output += f"@{var_name}\n"
        self._load_register_into_register(dest="A", src="M")
        self._load_register_into_register(dest="M", src="D")

    def write_push_pop(self, command_type: CommandType, segment, index):
        self.output = f"\n// {command_type.value} {segment} {index}\n"

        if segment == "constant":
            self._load_constant_into_d(index)
            self._load_d_into_stack_ptr()
            self._increment_stack_ptr()
        elif (
            segment == "local"
            or segment == "argument"
            or segment == "this"
            or segment == "that"
            or segment == "temp"
        ):
            map = {
                "local": "LCL",
                "argument": "ARG",
                "this": "THIS",
                "that": "THAT",
                "temp": "R5",
            }
            base = map[segment]
            self._load_into_var(base, index, load_from_m=segment != "temp")
            if command_type == CommandType.C_PUSH:
                self._load_ptr_into_stack()
                self._increment_stack_ptr()
            elif command_type == CommandType.C_POP:
                self._decrement_stack_ptr()
                self._load_stack_value_into_ptr()
        elif segment == "static":
            if command_type == CommandType.C_PUSH:
                self._static_address(index)
                self._load_register_into_register(dest="D", src="M")
                self._load_d_into_stack_ptr()
                self._increment_stack_ptr()
            elif command_type == CommandType.C_POP:
                self._decrement_stack_ptr()
                self._load_stack_ptr_value_into_d()
                self._static_address(index)
                self._load_register_into_register(dest="M", src="D")
        elif segment == "pointer":
            loc = "THIS" if index == 0 else "THAT"
            if command_type == CommandType.C_PUSH:
                self.output += f"// *SP = {loc}\n"
                self.output += f"// D = {loc}\n"
                self.output += f"@{loc}\n"
                self._load_register_into_register(dest="D", src="M")
                self._load_d_into_stack_ptr()
                self._increment_stack_ptr()
            elif command_type == CommandType.C_POP:
                self._decrement_stack_ptr()
                self.output += f"// {loc} = *SP\n"
                self._load_stack_ptr_value_into_d()
                self.output += f"// {loc} = D\n"
                self.output += f"@{loc}\n"
                self._load_register_into_register(dest="M", src="D")

        self.f.write(self.output)
        print(self.output, end="")

    def close(self):
        self.f.close()

    def write_arithmetic(self, command):
        self.output = f"\n// {command}\n"
        self._decrement_stack_ptr()
        self._load_stack_ptr_value_into_d()

        if command == "add" or command == "sub" or command == "or" or command == "and":
            if command == "sub":
                self._negate_d()  # -D+M for subtraction
            self._decrement_stack_ptr()
            self._perform_op_stack_ptr_value_into_d(command)
        elif command == "neg":
            self._negate_d()
        elif command == "not":
            self._not_d()
        else:
            # for eq, lt, gt
            self._negate_d()

            # SP--
            # D = D + *SP
            # D;JEQ/JLT/JGT
            self._decrement_stack_ptr()
            self._perform_addition_stack_ptr_value_into_d_comparison(command)

            # D = 0 (False)
            self._load_constant_into_d(0)
            # jump to end label
            self.output += "// jump to end label\n"
            self.output += f"@{self._get_end_label()}\n"
            self.output += "0;JMP\n"

            # (eq/lt/gt) label
            # D = -1 (True)
            self.output += f"({self._get_if_label(command)})\n"
            self._load_constant_into_d(0)
            self._decrement_d()  # for -1 (True)

            # end label
            self.output += f"({self._get_end_label()})\n"
            self.label_counter += 1

        self._load_d_into_stack_ptr()
        self._increment_stack_ptr()

        self.f.write(self.output)
        print(self.output, end="")

    def _decrement_d(self):
        self.output += "D=D-1\n"

    def _get_if_label(self, command):
        return f"{command}_{self.label_counter}"

    def _get_end_label(self):
        return f"end_{self.label_counter}"

    def _perform_addition_stack_ptr_value_into_d_comparison(self, command):
        op = "+"
        if command == "eq":
            jump = "JEQ"
        elif command == "lt":
            jump = "JLT"
        else:
            jump = "JGT"
        self.output += f"// D = D {op} *SP\n"
        self.output += "@SP\n"
        self._load_register_into_register(dest="A", src="M")
        self.output += f"D=D{op}M\n"
        self.output += f"@{self._get_if_label(command)}\n"
        self.output += f"D;{jump}\n"

    def _decrement_stack_ptr(self):
        self.output += "// SP--\n"
        self.output += "@SP\n"
        self.output += "M=M-1\n"

    def _increment_stack_ptr(self):
        self.output += "// SP++\n"
        self.output += "@SP\n"
        self.output += "M=M+1\n"

    def _load_stack_ptr_value_into_d(self):
        self.output += "// D = *SP\n"
        self.output += "@SP\n"
        self.output += "A=M\n"
        self._load_register_into_register(dest="D", src="M")

    def _perform_op_stack_ptr_value_into_d(self, command):
        # it is "+" for sub too
        # as we would do "D+M" by doing "D=-D" first
        if command == "add" or command == "sub":
            op = "+"
        elif command == "or":
            op = "|"
        elif command == "and":
            op = "&"
        self.output += f"// D = D {op} *SP\n"
        self.output += "@SP\n"
        self._load_register_into_register(dest="A", src="M")
        self.output += f"D=D{op}M\n"

    def _load_d_into_stack_ptr(self):
        self.output += "// *SP = D\n"
        self.output += "@SP\n"
        self.output += "A=M\n"
        self._load_register_into_register(dest="M", src="D")

    def _negate_d(self):
        self.output += "// D = -D\n"
        self.output += "D=-D\n"

    def _not_d(self):
        self.output += "// D = !D\n"
        self.output += "D=!D\n"

    def _load_constant_into_d(self, index):
        self.output += f"// D = {index}\n"
        self.output += f"@{index}\n"
        self.output += "D=A\n"

    def _static_address(self, i):
        filename_without_path = os.path.basename(self.filename)
        filename_without_ext = filename_without_path[:-4]
        self.output += f"@{filename_without_ext}.{i}\n"

    def _load_register_into_register(self, dest, src):
        self.output += f"{dest}={src}\n"

    def _load_into_var(self, base, offset, var_name="addr", load_from_m=True):
        self.output += f"// {var_name} = {base} + {offset}\n"

        self.output += f"// D = {base} + {offset}\n"
        self.output += f"@{base}\n"
        self._load_register_into_register(dest="D", src="M" if load_from_m else "A")
        self.output += f"@{offset}\n"
        self.output += "D=D+A\n"

        self.output += f"// {var_name} = D\n"
        self.output += f"@{var_name}\n"
        self._load_register_into_register(dest="M", src="D")
