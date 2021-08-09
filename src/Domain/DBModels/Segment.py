from Setup.ORM import sa
from decimal import Decimal


class SegmentModel(sa.Model):
    __tablename__ = 'segment'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    taxes: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    fees: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)

    def as_dict(self):
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}