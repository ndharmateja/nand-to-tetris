class FileParser:
    def __init__(self, filename):
        self.filename = filename
        self.commands = []
        self._parse()
        self.curr_command = 0

    def _parse(self):
        with open(self.filename, "r") as f:
            for line in f:
                line = self._remove_inline_comment(line)
                line = line.strip()
                if not line:
                    continue
                line = line.replace(" ", "")
                self.commands.append(line)

    def _remove_inline_comment(self, line: str):
        try:
            start_index = line.index("//")
            return line[:start_index]
        except ValueError:
            return line

    def has_more_commands(self):
        return self.curr_command < len(self.commands)

    def next_command(self):
        command = self.commands[self.curr_command]
        self.curr_command += 1
        return command

    def go_to_start(self):
        self.curr_command = 0
