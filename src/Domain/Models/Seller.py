from Setup.ORM import sa


class SellerModel(sa.Model):
    __tablename__: str = 'seller'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    type: int = sa.Column(sa.Integer, nullable=False)

    def __init__(self: object, id: int, name: str, type: int):
        self.id = id
        self.name = name
        self.type = type
