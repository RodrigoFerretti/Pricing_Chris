from flask import Flask
import os


app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = f"mysql://{os.environ['db_user']}:{os.environ['db_password']}" \
                                        f"@{os.environ['db_host']}:{os.environ['db_port']}/{os.environ['db_schema']}"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
