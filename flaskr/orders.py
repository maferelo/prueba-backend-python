from flask import Blueprint
from flask import jsonify
from flask import request

from flaskr.db import get_db
from flaskr.utils import validate, valid_address, get_model, product_of_customer
from flaskr.querys import LIST_ORDERS, UPDATE_ORDER_TOTAL, CREATE_ORDER_DETAIL, CREATE_ORDER

bp = Blueprint("orders", __name__)


@bp.route("/", methods=(["GET"]))
def index():
    """Show all the orders, most recent first."""
    db = get_db()
    ini_date = request.args.get('iniDate') or ""
    end_date = request.args.get('endDate') or ""
    
    if ini_date is None or end_date is None:
        return jsonify({'error': 'please provide both dates'})

    if not validate(ini_date) or not validate(end_date):
        return jsonify({'error': 'please provide valid dates'})

    orders = db.execute(LIST_ORDERS, (ini_date, end_date)).fetchall()
    orders = [dict(o) for o in orders]

    new_orders = []
    for order in orders:
        temp = order
        quantities = temp["quantities"].split(',')
        del temp['quantities']
        names = temp["names"].split(",")
        del temp['names']
        temp["products"] = list(zip(quantities,names))
        temp["products"] = ", ".join([" x ".join(p) for p in temp["products"]])
        new_orders.append(temp)

    return jsonify(new_orders)


@bp.route("/create-order", methods=(["POST"]))
def create():
    """Create a new order."""
    customer_id = request.args.get('customerId') or ""
    delivery_address = request.args.get('deliveryAddress') or ""

    customer = get_model(customer_id, 'customer')

    if len(customer) == 0:
        return jsonify({'error': 'please provide a valid customerId'})
    if not valid_address(delivery_address):
        return jsonify({'error': 'please provide a valid address'})

    db = get_db()
    cursor = db.cursor()
    cursor.execute("PRAGMA foreign_keys=ON;")
    cursor.execute(CREATE_ORDER, (customer_id, delivery_address))
    order = cursor.lastrowid
    cursor.close()
    db.commit()
    return jsonify({'order': order})


@bp.route("/create-order-detail", methods=(["POST"]))
def create_detail():
    """Create a new order detail."""
    customer_id = request.args.get('customerId') or ""
    order_id = request.args.get('orderId') or ""
    product_id = request.args.get('productId') or ""
    quantity = request.args.get('quantity') or ""

    customer = get_model(customer_id, 'customer')
    order = get_model(order_id, 'order')
    product = get_model(product_id, 'product')

    product_description = product['product_description']
    price = product['price']

    if len(customer) == 0:
        return jsonify({'error': 'please provide a valid customerId'})
    if len(order) == 0:
        return jsonify({'error': 'please provide a valid orderId'})
    if order['product_count'] == 5:
        return jsonify({'error': 'max. of 5 products per order are permited'})
    if len(product) == 0:
        return jsonify({'error': 'please provide a valid productId'})
    if not quantity.isdigit() or not int(quantity) > 0:
        return jsonify({'error': 'please provide a valid quantity'})
    if not product_of_customer(product_id, customer_id):
        return jsonify({'error': 'product not available for customer'})
    
    subtotal = price * int(quantity)

    db = get_db()

    cursor = db.cursor()
    cursor.execute("PRAGMA foreign_keys=ON;")
    cursor.execute(
        CREATE_ORDER_DETAIL,
        (order_id, product_id, product_description, price, quantity)
    )
    cursor.execute(UPDATE_ORDER_TOTAL, (subtotal, order_id))
    order_detail = cursor.lastrowid
    cursor.close()
    db.commit()
    return jsonify({ 'orderDetail': order_detail })