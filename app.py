from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:root@localhost:3306/pedregulho"
db = SQLAlchemy(app)


class Segment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    taxes = db.Column(db.Float, nullable=False)
    fees = db.Column(db.Float, nullable=False)

    def as_dict(self):
        return {column.name: getattr(self, column.name) for c in self.__table__.columns}

segments = Segment.query.all()

for segment in segments:
    print(segment.as_dict())
