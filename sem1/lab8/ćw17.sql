SELECT *
FROM salesman
WHERE salesman_id IN (
	SELECT DISTINCT
		salesman_id
	FROM customer c1
    WHERE NOT EXISTS (
		SELECT
			salesman_id
		FROM customer c2
        WHERE c1.salesman_id = c2.salesman_id AND c1.customer_id <> c2.customer_id
    )
)
ORDER BY salesman_id;