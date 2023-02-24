SELECT
	first_name,
    last_name
FROM employees e LEFT JOIN departments
USING(department_id)
WHERE department_name = "IT";