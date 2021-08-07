from enforce_typing import enforce_types


@enforce_types
class CityPrice:
    def __init__(self: object, id: int, price: float, 
                 product_id: int, city_id: int):
        self.id = id
        self.price = price
        self.product_id = product_id
        self.city_id = city_id

