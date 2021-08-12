import json
from src.Setup.API import app
from flask import request, Response
from src.Application.Service.Promotion import promotion_service


@app.route('/promotion', methods=['POST'])
def promotion_negotiation_route():
    request_json: dict = request.json
    try:
        result = promotion_service(
            request_json
        )
        return Response(
            response=json.dumps(
                result
            ),
            status=200,
            content_type='application/json'
        )
    except Exception as e:
        return Response(
            response=json.dumps(
                {
                    "ErrorMessage": e.message
                }
            ),
            status=400,
            content_type='application/json'
        )
