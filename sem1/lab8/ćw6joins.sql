SELECT
	o.ord_no,
    o.purch_amt,
    o.ord_date,
    o.customer_id,
    c.cust_name,
    o.salesman_id,
    s.name,
    s.commission
FROM orders o INNER JOIN customer c
USING(customer_id)
INNER JOIN salesman s
USING(salesman_id);