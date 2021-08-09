from decimal import Decimal


class CityPrice:
    def __init__(self: object, product_id: int, city_id: int, price: Decimal):
        self.product_id = product_id
        self.city_id = city_id
        self.price = price
