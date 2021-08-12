import os
from flask import Flask
import dotenv
from flask_swagger_ui import get_swaggerui_blueprint
import pymysql

dotenv.load_dotenv()


app: Flask = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = f"mysql+pymysql://{os.environ['db_user']}:{os.environ['db_password']}" \
                                        f"@{os.environ['db_host']}:{os.environ['db_port']}/{os.environ['db_schema']}"

app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

swagger_url: str = '/api/docs'  
swagger_data_route: str = '/swagger-data' 
swaggerui_blueprint = get_swaggerui_blueprint(
    swagger_url, 
    swagger_data_route,
    config={
        'app_name': "Pedregulho"
    }
)
app.register_blueprint(
    swaggerui_blueprint
)
