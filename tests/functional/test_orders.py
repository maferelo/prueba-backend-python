# TODO: More test cases, check grouping totals and no products

CREATE_ORDER_PARAMS = {
    "customerId": "1",
    "deliveryAddress": "Delivery Address"
}

ORDER_DETAIL_PARAMS = {
    "customerId": "1",
    "orderId": "",
    "productId": "4",
    "quantity": "4"
}

ORDER_LIST_PARAMS = {
    "iniDate": "2014-10-09",
    "endDate": "2030-10-09"
}

def test_create_order(client):
    order = client.post('/create-order', query_string=CREATE_ORDER_PARAMS).json
    assert "order" in order

def test_create_order_detail(client):
    order = client.post('/create-order', query_string=CREATE_ORDER_PARAMS).json
    order_detail_params = ORDER_DETAIL_PARAMS
    order_detail_params["orderId"] = order["order"]
    order_detail = client.post('/create-order-detail', query_string=order_detail_params)
    order_detail = order_detail.json
    assert "orderDetail" in order_detail

def test_orders(client):
    order = client.post('/create-order', query_string=CREATE_ORDER_PARAMS).json
    order_detail_params = ORDER_DETAIL_PARAMS
    order_detail_params["orderId"] = order["order"]
    order_detail = client.post('/create-order-detail', query_string=order_detail_params)
    order_detail = order_detail.json["orderDetail"]
    order_list = client.get('/', query_string=ORDER_LIST_PARAMS).json
    assert order_list[-1]["order_id"] == order["order"]