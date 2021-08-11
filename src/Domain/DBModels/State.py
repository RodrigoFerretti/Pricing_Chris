from Setup.ORM import sa


class StateModel(sa.Model):
    __tablename__:str = 'state'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)

    def as_dict(self: object):
        model_dict: dict = {column.name: getattr(self, column.name) for column in self.__table__.columns}
        return model_dict
