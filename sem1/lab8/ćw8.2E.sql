SELECT
	employee_id,
    CONCAT(first_name," ", last_name) AS employee_name,
    hire_date
FROM employees
WHERE hire_date > (
	SELECT
		hire_date
	FROM employees
    WHERE last_name = 'Jones'
);