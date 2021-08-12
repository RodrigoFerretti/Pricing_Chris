from src.Setup.ORM import sa
from decimal import Decimal


class ProductModel(sa.Model):
    __tablename__: str = 'product'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    fabrication_costs: Decimal = sa.Column(sa.DECIMAL(15, 2), nullable=False)

    def as_dict(self: object):
        model_dict: dict = {column.name: getattr(self, column.name) for column in self.__table__.columns}
        return model_dict
