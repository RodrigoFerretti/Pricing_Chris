from enforce_typing import enforce_types


@enforce_types
class Client:
    def __init__(self: object, id: int, name: str, 
                 segment: int, location: str, tpv: float):
        self.id = id
        self.name = name
        self.segment = segment
        self.location = location
        self.tpv = tpv
