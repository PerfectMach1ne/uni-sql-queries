SELECT
	ord_no
FROM orders
WHERE salesman_id = (
	SELECT
		salesman_id
	FROM salesman
    WHERE city = 'New York');