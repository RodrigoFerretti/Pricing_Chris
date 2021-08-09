from Setup.ORM import sa
from decimal import Decimal
from Domain.Models.State import StateModel
from Domain.Models.Product import ProductModel


class StatePriceModel(sa.Model):
    __tablename__: str = 'stateprice'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    price: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    product_id: int = sa.Column(sa.Integer, sa.ForeignKey(ProductModel.id), nullable=False)
    state_id: int = sa.Column(sa.Integer, sa.ForeignKey(StateModel.id), nullable=False)

    def __init__(self: object, id: int, price: Decimal, 
                 product_id: int, state_id: int):
        self.id = id
        self.price = price
        self.product_id = product_id
        self.state_id = state_id
