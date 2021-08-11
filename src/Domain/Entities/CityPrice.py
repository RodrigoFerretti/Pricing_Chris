from decimal import Decimal


class CityPrice:
    def __init__(self: object, product_id: int, city_id: int, segment_id: int, price: Decimal):
        self.product_id: int = product_id
        self.city_id: int = city_id
        self.segment_id: int = segment_id
        self.price: Decimal = price
