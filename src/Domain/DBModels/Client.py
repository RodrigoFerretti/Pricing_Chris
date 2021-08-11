from Setup.ORM import sa
from decimal import Decimal
from Domain.DBModels.Segment import SegmentModel
from Domain.DBModels.Location import LocationModel


class ClientModel(sa.Model):
    __tablename__: str = 'client'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    tpv: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    segment_id: int = sa.Column(sa.Integer, sa.ForeignKey(SegmentModel.id), nullable=False)
    location_id: int = sa.Column(sa.Integer, sa.ForeignKey(LocationModel.id), nullable=False)

    def as_dict(self: object):
        model_dict: dict = {column.name: getattr(self, column.name) for column in self.__table__.columns}
        return model_dict
