from enum import Enum
from typing import List


class CommandType(Enum):
    C_ARITHMETIC = "arithmetic"
    C_PUSH = "push"
    C_POP = "pop"
    C_LABEL = "label"
    C_GOTO = "goto"
    C_IF = "if"
    C_FUNCTION = "function"
    C_RETURN = "return"
    C_CALL = "call"


class Parser:
    def __init__(self, filename):
        self.filename = filename
        self.commands: List[str] = []
        self._parse()
        self.curr_command_index = -1

    def _parse(self):
        with open(self.filename, "r") as f:
            for line in f:
                line = self._remove_inline_comment(line)
                line = line.strip()
                if not line:
                    continue
                self.commands.append(line)

    def _remove_inline_comment(self, line: str):
        try:
            start_index = line.index("//")
            return line[:start_index]
        except ValueError:
            return line

    def has_more_commands(self) -> bool:
        return self.curr_command_index < len(self.commands) - 1

    def advance(self):
        self.curr_command_index += 1

    def get_command_type(self) -> CommandType:
        command = self.commands[self.curr_command_index]
        if command.startswith("push"):
            return CommandType.C_PUSH
        if command.startswith("pop"):
            return CommandType.C_POP
        if command.startswith("label"):
            return CommandType.C_LABEL
        if command.startswith("goto"):
            return CommandType.C_GOTO
        if command.startswith("if"):
            return CommandType.C_IF
        if command.startswith("function"):
            return CommandType.C_FUNCTION
        if command.startswith("return"):
            return CommandType.C_RETURN
        if command.startswith("call"):
            return CommandType.C_CALL
        return CommandType.C_ARITHMETIC

    def _has_arg1(self):
        return self.get_command_type() != CommandType.C_RETURN

    def arg1(self) -> str:
        if not self._has_arg1():
            raise "Command doesn't have arg1"
        if self.get_command_type() == CommandType.C_ARITHMETIC:
            return self.commands[self.curr_command_index]
        return self.commands[self.curr_command_index].split(" ")[1]

    def _has_arg2(self):
        return (
            self.get_command_type() == CommandType.C_PUSH
            or self.get_command_type() == CommandType.C_POP
            or self.get_command_type() == CommandType.C_FUNCTION
            or self.get_command_type() == CommandType.C_CALL
        )

    def arg2(self) -> int:
        if not self._has_arg2():
            raise "Command doesn't have arg1"
        return int(self.commands[self.curr_command_index].split(" ")[2])
