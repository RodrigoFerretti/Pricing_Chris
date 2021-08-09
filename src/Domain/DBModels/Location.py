from Setup.ORM import sa
from Domain.DBModels.City import CityModel
from Domain.DBModels.State import StateModel


class LocationModel(sa.Model):
    __tablename__: str = 'location'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    city_id: int = sa.Column(sa.Integer, sa.ForeignKey(CityModel.id), nullable=False)
    state_id: int = sa.Column(sa.Integer, sa.ForeignKey(StateModel.id), nullable=False)

    def as_dict(self):
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}