SELECT
	first_name,
    last_name,
    department_id,
    department_name
FROM employees INNER JOIN departments
USING(department_id);