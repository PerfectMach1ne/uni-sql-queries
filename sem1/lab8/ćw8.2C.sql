SELECT
	first_name,
    last_name,
    job_id,
    department_id
FROM employees INNER JOIN departments
USING(department_id)
INNER JOIN locations
USING(location_id)
WHERE city = 'London';