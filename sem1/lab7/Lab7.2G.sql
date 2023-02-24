SELECT
	first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
	SELECT
		AVG(salary) AS avg_salary
	FROM employees)
ORDER BY salary DESC;