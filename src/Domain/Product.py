from enforce_typing import enforce_types


@enforce_types
class Product:
    def __init__(self: object, id: int, name: str, fabrication_costs: float):
        self.id = id
        self.name = name
        self.fabrication_costs = fabrication_costs

