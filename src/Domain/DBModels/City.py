from src.Setup.ORM import sa
from src.Domain.DBModels.State import StateModel


class CityModel(sa.Model):
    __tablename__: str = 'city'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    state_id: int = sa.Column(sa.Integer, sa.ForeignKey(StateModel.id), nullable=False)

    def as_dict(self: object):
        model_dict: dict = {column.name: getattr(self, column.name) for column in self.__table__.columns}
        return model_dict
