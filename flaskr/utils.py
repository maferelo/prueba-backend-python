import datetime
from flaskr.db import get_db
from flaskr.querys import PRODUCT_OF_CUSTOMER, GET_MODEL


def validate(date_text):
    try:
        datetime.datetime.strptime(date_text, '%Y-%m-%d')
        return True
    except ValueError:
        return False

def get_model(id_, table):
    result = []
    if id_.isdigit():
        db = get_db()
        result = db.execute(GET_MODEL[table], (id_,)).fetchone() or []
    return dict(result)

def valid_address(address):
    lenght = len(address)
    return lenght >=1 and lenght <= 191

def product_of_customer(product_id, customer_id):
    db = get_db()
    results = db.execute(PRODUCT_OF_CUSTOMER, (customer_id,)).fetchall() or []
    results = [result['product_id'] for result in results]
    return int(product_id) in results
