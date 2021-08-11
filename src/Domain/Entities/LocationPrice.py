from decimal import Decimal


class LocationPrice:
    def __init__(self: object, product_id: int, location_id: int, segment_id: int,
                 price: Decimal, transportation_price: Decimal):
        self.product_id: int = product_id
        self.location_id: int = location_id
        self.segment_id: int = segment_id
        self.price: Decimal = price
        self.transportation_price: Decimal = transportation_price
