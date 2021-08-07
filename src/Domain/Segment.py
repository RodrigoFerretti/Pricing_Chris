from enforce_typing import enforce_types


@enforce_types
class Segment:
    def __init__(self: object, id: int, name: str, 
                 taxes: float, fees: float):
        self.id = id
        self.name = name
        self.taxes = taxes
        self.fees = fees
