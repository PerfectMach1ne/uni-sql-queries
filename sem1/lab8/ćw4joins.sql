SELECT
	customer_id,
    cust_name,
    s.salesman_id,
    name
FROM customer c INNER JOIN salesman s
USING(salesman_id)
WHERE commission > 0.12;