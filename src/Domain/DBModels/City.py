from Setup.ORM import sa
from Domain.DBModels.State import StateModel


class CityModel(sa.Model):
    __tablename__: str = 'city'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    state_id: int = sa.Column(sa.Integer, sa.ForeignKey(StateModel.id), nullable=False)

    def __init__(self: object, id: int, name: str, state_id: int):
        self.id = id
        self.name = name
        self.state_id = state_id

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
