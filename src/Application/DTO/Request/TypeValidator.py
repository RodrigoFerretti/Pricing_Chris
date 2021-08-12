from src.Application.Exceptions.DTOTypeException import DTOTypeException
from src.Application.Exceptions.UnexpectedArgument import UnexpectedArgument

class RequestTypeValidator:
    def __init__(self, dto_class: type, request_json:dict):
        annotations: dict = dto_class.__init__.__annotations__
        for attribute in request_json:
            if annotations.get(attribute) is None:
                raise(UnexpectedArgument(attribute)) 
            received_type: type = type(request_json[attribute])
            expected_type: type = annotations[attribute]
            if received_type != expected_type:
                raise DTOTypeException(attribute, received_type, expected_type)

