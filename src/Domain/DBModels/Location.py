from Setup.ORM import sa
from Domain.DBModels.City import CityModel
from Domain.DBModels.State import StateModel


class LocationModel(sa.Model):
    __tablename__: str = 'location'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    city_id: int = sa.Column(sa.Integer, sa.ForeignKey(CityModel.id), nullable=False)
    state_id: int = sa.Column(sa.Integer, sa.ForeignKey(StateModel.id), nullable=False)

    def __init__(self: object, id: int, name: str, 
                 city_id: int, state_id: int):
        self.id = id
        self.name = name
        self.city_id = city_id
        self.state_id = state_id

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
