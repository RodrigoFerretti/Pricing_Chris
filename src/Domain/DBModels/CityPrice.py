from src.Setup.ORM import sa
from decimal import Decimal
from src.Domain.DBModels.City import CityModel
from src.Domain.DBModels.Product import ProductModel
from src.Domain.DBModels.Segment import SegmentModel


class CityPriceModel(sa.Model):
    __tablename__: str = 'cityprice'

    product_id: int = sa.Column(sa.Integer, sa.ForeignKey(ProductModel.id), primary_key=True, nullable=False)
    city_id: int = sa.Column(sa.Integer, sa.ForeignKey(CityModel.id), primary_key=True, nullable=False)
    segment_id: int = sa.Column(sa.Integer, sa.ForeignKey(SegmentModel.id), primary_key=True, nullable=False)
    price: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)

    def as_dict(self: object):
        model_dict: dict = {column.name: getattr(self, column.name) for column in self.__table__.columns}
        return model_dict
