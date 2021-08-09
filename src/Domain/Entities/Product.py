from decimal import Decimal


class Product:
    def __init__(self: object, id: int, name: str, fabrication_costs: Decimal):
        self.id = id
        self.name = name
        self.fabrication_costs = fabrication_costs
