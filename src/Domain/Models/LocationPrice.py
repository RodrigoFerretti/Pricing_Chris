from Setup.ORM import sa
from decimal import Decimal
from Domain.Models.Product import ProductModel
from Domain.Models.Location import LocationModel


class LocationPriceModel(sa.Model):
    __tablename__: str = 'locationprice'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    price: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    transportation_price: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    product_id: int = sa.Column(sa.Integer, sa.ForeignKey(ProductModel.id), nullable=False)
    location_id: int = sa.Column(sa.Integer, sa.ForeignKey(LocationModel.id), nullable=False)

    def __init__(self: object, id: int, price: Decimal, 
                 transportation_price: Decimal, product_id: int, location_id: int):
        self.id = id
        self.price = price
        self.transportation_price = transportation_price
        self.product_id = product_id
        self.location_id = location_id
