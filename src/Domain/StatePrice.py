from enforce_typing import enforce_types
from decimal import Decimal


@enforce_types
class StatePrice:
    def __init__(self: object, id: int, price: Decimal, 
                 product_id: int, state_id: int):
        self.id = id
        self.price = price
        self.product_id = product_id
        self.state_id = state_id
