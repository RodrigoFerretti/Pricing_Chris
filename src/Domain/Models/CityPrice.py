from Setup.ORM import sa
from decimal import Decimal
from Domain.Models.City import CityModel
from Domain.Models.Product import ProductModel


class CityPriceModel(sa.Model):
    __tablename__: str = 'cityprice'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    price: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    product_id: int = sa.Column(sa.Integer, sa.ForeignKey(ProductModel.id), nullable=False)
    city_id: int = sa.Column(sa.Integer, sa.ForeignKey(CityModel.id), nullable=False)

    def __init__(self: object, id: int, price: Decimal, 
                 product_id: int, city_id: int):
        self.id = id
        self.price = price
        self.product_id = product_id
        self.city_id = city_id
