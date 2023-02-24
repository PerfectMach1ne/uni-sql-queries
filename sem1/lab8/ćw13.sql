SELECT *
FROM orders o1
WHERE purch_amt >= (
	SELECT AVG(purch_amt)
    FROM orders o2
    WHERE o1.customer_id = o2.customer_id);