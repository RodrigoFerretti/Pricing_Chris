import sqlalchemy as sa
from sqlalchemy.orm import scoped_session, sessionmaker

db_session = None


class MYSQLDatabase:
    def __init__(self: object, host: str, port: int, 
                 user: str, password: str, schema: str):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.schema = schema
    
    def session(self):
        global db_session
        if db_session is None:
            connection_string = f'mysql://{self.user}:{self.password}@{self.host}:{self.port}/{self.schema}'
            engine = sa.create_engine(connection_string)
            db_session = scoped_session(sessionmaker(bind=engine))
        return db_session
