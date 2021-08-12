class UnexpectedArgument(Exception):
    def __init__(self: object, argument: str):
        self.message: str = f'Unexpected argument: {argument}'
        super().__init__(self.message)
