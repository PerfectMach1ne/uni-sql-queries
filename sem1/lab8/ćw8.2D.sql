SELECT
	e.employee_id,
    CONCAT(e.first_name," ", e.last_name) AS employee_name,
    e.hire_date,
    e.manager_id,
    CONCAT(m.first_name," ", m.last_name) AS manager_name
FROM employees e JOIN employees m
USING(employee_id);