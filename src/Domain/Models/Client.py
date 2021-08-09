from Setup.ORM import sa
from decimal import Decimal
from Domain.Models.Segment import SegmentModel
from Domain.Models.Location import LocationModel


class ClientModel(sa.Model):
    __tablename__: str = 'client'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    tpv: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    segment_id: int = sa.Column(sa.Integer, sa.ForeignKey(SegmentModel.id), nullable=False)
    location_id: int = sa.Column(sa.Integer, sa.ForeignKey(LocationModel.id), nullable=False)

    def __init__(self: object, id: int, name: str, 
                 tpv: Decimal, segment_id: int, location_id: int):
        self.id = id
        self.name = name
        self.tpv = tpv
        self.segment_id = segment_id
        self.location_id = location_id
