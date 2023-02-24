SELECT *
FROM orders
WHERE purch_amt > ANY (
	SELECT DISTINCT
		purch_amt
	FROM orders
    WHERE ord_date = '2012-09-10'
);