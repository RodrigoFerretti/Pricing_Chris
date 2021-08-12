import yaml
import json
from src.Setup.API import app
from flask import Response


@app.route('/swagger-data', methods=['GET'])
def swagger_data_route():
    with open('src/Setup/Swagger.yaml', 'r') as yaml_in:
        swagger_data: dict = yaml.safe_load(yaml_in)
    
    return Response(
        response=json.dumps(
            swagger_data
        ),
        status=200,
        content_type='application/json'
    )
