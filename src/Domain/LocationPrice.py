from enforce_typing import enforce_types


@enforce_types
class LocationPrice:
    def __init__(self: object, id: int, price: float, 
                 product_id: int, location_id: int):
        self.id = id
        self.price = price
        self.product_id = product_id
        self.location_id = location_id

