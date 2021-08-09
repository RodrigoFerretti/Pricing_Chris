from Setup.ORM import sa
from decimal import Decimal
from Domain.DBModels.Product import ProductModel
from Domain.DBModels.Location import LocationModel


class LocationPriceModel(sa.Model):
    __tablename__: str = 'locationprice'

    product_id: int = sa.Column(sa.Integer, sa.ForeignKey(ProductModel.id), primary_key=True, nullable=False)
    location_id: int = sa.Column(sa.Integer, sa.ForeignKey(LocationModel.id), primary_key=True, nullable=False)
    price: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    transportation_price: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)

    def as_dict(self):
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}