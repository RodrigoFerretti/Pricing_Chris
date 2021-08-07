from enforce_typing import enforce_types


@enforce_types
class Price:
    def __init__(self: object, offer: float):
        self.offer = offer
    
    def get_minimum_price(self):
        # TO DO
        self.minimum = 0.00

    def is_profitable(self):
        # TO DO
        self.profitable = False
