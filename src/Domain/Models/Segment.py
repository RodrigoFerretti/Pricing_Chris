from Setup.ORM import sa
from decimal import Decimal


class SegmentModel(sa.Model):
    __tablename__ = 'segment'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    taxes: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)
    fees: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)

    def __init__(self: object, id: int, name: str, taxes: Decimal, fees: Decimal):
        self.id = id
        self.name = name
        self.taxes = taxes
        self.fees = fees

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
