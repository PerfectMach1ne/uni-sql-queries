SELECT
	ord_no
FROM orders
WHERE salesman_id = (
	SELECT DISTINCT
		salesman_id
	FROM salesman
    WHERE customer_id = 3007);