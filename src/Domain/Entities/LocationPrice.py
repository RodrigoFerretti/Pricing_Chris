from decimal import Decimal


class LocationPrice:
    def __init__(self: object, product_id: int, location_id: int, 
                 price: Decimal, transportation_price: Decimal):
        self.product_id = product_id
        self.location_id = location_id
        self.price = price
        self.transportation_price = transportation_price
