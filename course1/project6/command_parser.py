from symbol_table import SymbolTable


class CommandParser:
    def __init__(self, symbol_table: SymbolTable):
        # SymbolTable object
        self.symbol_table = symbol_table
        # The current number of commands we have seen
        self.command_count = 0
        # The current memory location
        self.curr_memory_location = 16

        # Destination map
        self.dest_map = {
            "null": "000",
            "M": "001",
            "D": "010",
            "MD": "011",
            "A": "100",
            "AM": "101",
            "AD": "110",
            "AMD": "111",
        }

        # Computation map
        self.comp_map = {
            "0": "0101010",
            "1": "0111111",
            "-1": "0111010",
            "D": "0001100",
            "A": "0110000",
            "M": "1110000",
            "!D": "0001101",
            "!A": "0110001",
            "!M": "1110001",
            "-D": "0001111",
            "-A": "0110011",
            "-M": "1110011",
            "D+1": "0011111",
            "A+1": "0110111",
            "M+1": "1110111",
            "D-1": "0001110",
            "A-1": "0110010",
            "M-1": "1110010",
            "D+A": "0000010",
            "D+M": "1000010",
            "D-A": "0010011",
            "D-M": "1010011",
            "A-D": "0000111",
            "M-D": "1000111",
            "D&A": "0000000",
            "D&M": "1000000",
            "D|A": "0010101",
            "D|M": "1010101",
        }

        # Jumps map
        self.jump_map = {
            "null": "000",
            "JGT": "001",
            "JEQ": "010",
            "JGE": "011",
            "JLT": "100",
            "JNE": "101",
            "JLE": "110",
            "JMP": "111",
        }

    # Check if the given command is a label
    def is_label(self, command: str):
        return command.startswith("(")

    # Check if the given command is an A-instruction
    def is_a_instruction(self, command: str):
        return command.startswith("@")

    # Get the label (without parentheses) from a pseudo command
    def get_label(self, pseudo_command):
        return pseudo_command[1:-1]

    # Process a command
    def process_if_label(self, command):
        if not self.is_label(command):
            # If the command is not a label, increment the command count
            self.command_count += 1
        else:
            # If the command is a label, add it to the symbol table
            label = self.get_label(command)
            self.symbol_table.put(label, self.command_count)

    def parse_a_instruction(self, a_instruction):
        symbol = a_instruction[1:]
        try:
            # If symbol is a number
            value = int(symbol)
        except:
            # Check if the symbol is not in the symbol table
            if not self.symbol_table.contains(symbol):
                # Add the symbol with the current memory location
                self.symbol_table.put(symbol, self.curr_memory_location)
                # Increment the memory location for the next new symbol
                self.curr_memory_location += 1

            # Retrieve the value associated with the symbol
            value = self.symbol_table.get(symbol)

        # Return the op code (0) + 15-bit binary representation of the value
        return "0" + format(value, "015b")

    def parse_c_instruction(self, c_instruction: str):
        if "=" not in c_instruction:
            c_instruction = "null=" + c_instruction
        if ";" not in c_instruction:
            c_instruction += ";null"

        dest, comp, jump = self.split_c_instruction(c_instruction)
        return f"111{self.comp_map[comp]}{self.dest_map[dest]}{self.jump_map[jump]}"

    def split_c_instruction(self, c_instruction: str):
        dest, temp = c_instruction.split("=")
        comp, jump = temp.split(";")
        return dest, comp, jump

    def parse(self, command: str):
        # A-instruction
        if self.is_a_instruction(command):
            return self.parse_a_instruction(command)

        # C-instruction
        return self.parse_c_instruction(command)
