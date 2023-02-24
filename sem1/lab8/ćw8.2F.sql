SELECT
	department_name,
    COUNT(employee_id) AS employee_count
FROM departments LEFT JOIN employees
USING(department_id)
GROUP BY department_name
ORDER BY employee_count DESC;