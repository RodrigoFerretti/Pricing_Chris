from decimal import Decimal


class Product:
    def __init__(self: object, id: int, name: str, fabrication_costs: Decimal):
        self.id: int = id
        self.name: str = name
        self.fabrication_costs: Decimal = fabrication_costs
