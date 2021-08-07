from enforce_typing import enforce_types


@enforce_types
class City:
    def __init__(self: object, id: int, name: str, state_id: int):
        self.id = id
        self.name = name
        self.state_id = state_id
