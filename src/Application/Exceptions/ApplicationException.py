class ApplicationException(Exception):
    def __init__(self: object, exception: Exception):
        if hasattr(exception, 'message'):
            self.message: str = exception.message
        if type(exception) == TypeError or type(exception) == AttributeError:
            self.message: str = exception.args[0].replace('__init__() ', '')
        super().__init__(self.message)
