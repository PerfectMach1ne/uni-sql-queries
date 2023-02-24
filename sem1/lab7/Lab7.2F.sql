WITH min_salary AS (
	SELECT
		employee_id,
		MIN(salary)
	FROM employees
    GROUP BY job_id
) SELECT
	job_id
	first_name,
    last_name,
    salary
FROM employees JOIN min_salary
USING(employee_id)
ORDER BY job_id;