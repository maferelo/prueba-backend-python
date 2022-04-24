LIST_ORDERS = """
        select 
            o.creation_date,
            o.order_id,
            o.total,
            o.delivery_address,
            group_concat(d.quantity) as "quantities",
            group_concat(p."name") as "names"
        from 
            "order" o
        inner join 
            order_detail d on o.order_id = d.order_id
        inner join 
            product p on p.product_id = d.product_id
        WHERE   
            o.creation_date >= ?
        AND 
            o.creation_date <= ?
        group by
            o.creation_date,
            o.order_id,
            o.total,
            o.delivery_address
        order by 
            o.creation_date
    """

UPDATE_ORDER_TOTAL = """
        UPDATE 'order' SET 
            product_count = product_count + 1,
            total = total + ? 
        WHERE order_id = ?
    """

CREATE_ORDER_DETAIL = """
        INSERT INTO 
            "order_detail" (order_id, product_id, product_description, price, quantity) 
        VALUES 
            (?, ?, ?, ?, ?)
    """

CREATE_ORDER = """
    INSERT INTO "order" (customer_id, delivery_address) VALUES (?, ?)
"""

PRODUCT_OF_CUSTOMER = """
    SELECT 
        p.product_id
    FROM
        product p
    INNER JOIN 
        customer_product cp
    ON
        cp.product_id = p.product_id 
    INNER JOIN
        customer c 
    ON 	
        c.customer_id = cp.customer_id 
    WHERE
        c.customer_id = ?
"""

GET_MODEL = {
    "customer": "select * from customer WHERE customer_id = ?",
    "order": "select * from 'order' WHERE order_id = ?",
    "product": "select * from product WHERE product_id = ?"
}