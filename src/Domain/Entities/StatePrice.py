from decimal import Decimal


class StatePrice:
    def __init__(self: object, id: int, price: Decimal, 
                 product_id: int, state_id: int):
        self.id = id
        self.price = price
        self.product_id = product_id
        self.state_id = state_id
