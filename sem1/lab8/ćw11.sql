SELECT
	salesman_id,
    name
FROM salesman s
WHERE 1 < (
	SELECT COUNT(*)
	FROM customer c
    WHERE c.salesman_id = s.salesman_id);