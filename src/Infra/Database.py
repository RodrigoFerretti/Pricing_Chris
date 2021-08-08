import pymysql

db_connection = None

class Database:
    def __init__(self: object, host: str, port: int, 
                 user: str, password: str, schema: str):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.schema = schema
    
    def connect(self):
        global db_connection
        if db_connection is None:
            db_connection = pymysql.connect(host=self.host, port=self.port, user=self.user, 
                                            password=self.password, database=self.schema,
                                            cursorclass=pymysql.cursors.DictCursor)
        return db_connection


mysql = Database('localhost', 3306, 'root', 'root', 'pedregulho')

conn = mysql.connect()

cursor = conn.cursor()

sql = 'SELECT * FROM client'

cursor.execute(sql)

result = cursor.fetchall()

