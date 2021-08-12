class NotFoundException(Exception):
    def __init__(self: object, db_model: type):
        self.message: str = f'{db_model.__tablename__} not found'
        super().__init__(self.message)
