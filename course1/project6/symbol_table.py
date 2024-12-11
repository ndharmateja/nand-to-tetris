class SymbolTable:
    def __init__(self):
        self.dictionary = {}
        self._init_symbol_table()

    def _init_symbol_table(self):
        for i in range(16):
            self.dictionary[f"R{i}"] = i
        self.dictionary["SP"] = 0
        self.dictionary["LCL"] = 1
        self.dictionary["ARG"] = 2
        self.dictionary["THIS"] = 3
        self.dictionary["THAT"] = 4
        self.dictionary["SCREEN"] = 16384
        self.dictionary["KBD"] = 24576

    def put(self, symbol, value):
        self.dictionary[symbol] = value

    def get(self, symbol):
        return self.dictionary[symbol]

    def contains(self, symbol):
        return symbol in self.dictionary

    def __str__(self):
        return str(self.dictionary)
