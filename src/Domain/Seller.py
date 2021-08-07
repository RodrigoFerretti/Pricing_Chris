from enforce_typing import enforce_types


@enforce_types
class Seller:
    def __init__(self: object, id: int, name: str, type: int):
        self.id = id
        self.name = name
        self.type = type
