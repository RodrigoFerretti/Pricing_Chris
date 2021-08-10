from decimal import Decimal


class StatePrice:
    def __init__(self: object, product_id: int, state_id: int, segment_id: int, price: Decimal):
        self.product_id = product_id
        self.state_id = state_id
        self.segment_id = segment_id
        self.price = price
