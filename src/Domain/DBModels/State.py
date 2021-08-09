from Setup.ORM import sa


class StateModel(sa.Model):
    __tablename__:str = 'state'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)

    def __init__(self: object, id: int, name: str):
        self.id = id
        self.name = name

    def as_dict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}
