import sys

from command_parser import CommandParser
from file_parser import FileParser
from symbol_table import SymbolTable


def create_machine_language_filename(filename):
    filename = filename.replace("in", "out")
    filename = filename.replace(".asm", ".hack")
    return filename


def main():
    in_filename = sys.argv[1]
    out_filename = create_machine_language_filename(in_filename)

    file_parser = FileParser(in_filename)
    symbol_table = SymbolTable()
    command_parser = CommandParser(symbol_table)

    # First pass to parse labels and add to symbol table
    while file_parser.has_more_commands():
        command = file_parser.next_command()
        command_parser.process_if_label(command)

    # Second pass to actually convert each command to a binary instruction
    file_parser.go_to_start()
    with open(out_filename, "w") as f:
        while file_parser.has_more_commands():
            command = file_parser.next_command()
            if command_parser.is_label(command):
                continue
            binary_instruction = command_parser.parse(command)
            f.write(f"{binary_instruction}\n")


if __name__ == "__main__":
    main()
