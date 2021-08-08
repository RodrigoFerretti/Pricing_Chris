from enforce_typing import enforce_types
from decimal import Decimal


@enforce_types
class Segment:
    def __init__(self: object, id: int, name: str, 
                 taxes: Decimal, fees: Decimal):
        self.id = id
        self.name = name
        self.taxes = taxes
        self.fees = fees
