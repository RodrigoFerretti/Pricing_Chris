from Setup.ORM import sa
from decimal import Decimal


class ProductModel(sa.Model):
    __tablename__: str = 'product'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    fabrication_costs: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)

    def __init__(self: object, id: int, name: str, fabrication_costs: Decimal):
        self.id = id
        self.name = name
        self.fabrication_costs = fabrication_costs
