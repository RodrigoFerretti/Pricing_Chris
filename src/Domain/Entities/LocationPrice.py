from decimal import Decimal


class LocationPrice:
    def __init__(self: object, id: int, price: Decimal, 
                 transportation_price: Decimal, product_id: int, location_id: int):
        self.id = id
        self.price = price
        self.transportation_price = transportation_price
        self.product_id = product_id
        self.location_id = location_id
