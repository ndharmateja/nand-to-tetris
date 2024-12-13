import sys

from code_writer import CodeWriter
from command_parser import CommandType, Parser


def create_assembly_language_filename(filename):
    filename = filename.replace(".vm", ".asm")
    return filename


def main():
    input_filename = sys.argv[1]
    output_filename = create_assembly_language_filename(input_filename)
    parser = Parser(input_filename)
    writer = CodeWriter(output_filename)
    while parser.has_more_commands():
        parser.advance()
        command_type: CommandType = parser.get_command_type()
        if command_type == CommandType.C_ARITHMETIC:
            writer.write_arithmetic(parser.arg1())
        elif command_type == CommandType.C_PUSH or command_type == CommandType.C_POP:
            writer.write_push_pop(command_type, parser.arg1(), parser.arg2())
    writer.close()


if __name__ == "__main__":
    main()
