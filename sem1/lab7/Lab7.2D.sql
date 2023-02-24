SELECT
	first_name,
    last_name
FROM employees e LEFT JOIN departments
USING(department_id)
LEFT JOIN locations
USING(location_id)
WHERE e.manager_id <> 0 AND country_id = 'US';