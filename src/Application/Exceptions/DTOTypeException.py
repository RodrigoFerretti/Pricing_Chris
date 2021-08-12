from src.Application.DTO.JSONTypes import JSONTypes


class DTOTypeException(Exception):
    def __init__(self: object, attribute: str, received_type: type, expected_type: type):
        self.message: str = f'Excpeted type {getattr(JSONTypes, expected_type.__name__)} ' \
                            f'for {attribute} but received {getattr(JSONTypes, received_type.__name__)}'
        super().__init__(self.message)
