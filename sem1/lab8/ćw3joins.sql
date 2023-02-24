SELECT
	customer_id,
    cust_name,
    s.salesman_id,
    name
FROM customer c INNER JOIN salesman s
ON c.salesman_id = s.salesman_id;