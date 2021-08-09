from Setup.ORM import sa


class SellerModel(sa.Model):
    __tablename__: str = 'seller'

    id: int = sa.Column(sa.Integer, primary_key=True, autoincrement=True)
    name: str = sa.Column(sa.VARCHAR(45), nullable=False)
    type: int = sa.Column(sa.Integer, nullable=False)

    def as_dict(self):
        return {column.name: getattr(self, column.name) for column in self.__table__.columns}