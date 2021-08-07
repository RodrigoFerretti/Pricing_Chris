from enforce_typing import enforce_types


@enforce_types
class State:
    def __init__(self: object, id: int, name: str):
        self.id = id
        self.name = name
