from flaskr import orders
import json

def test_orders(client):
    response = client.get('/')
    assert response.status_code == 200

"""
#from flask import jsonify
def test_orders(app):
    with app.app_context():
        response = app.test_client().get("/")
        response = response.data.decode('utf-8')
        orders = '[]\n'
        assert orders == response
"""