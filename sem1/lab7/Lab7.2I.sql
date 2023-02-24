WITH min_salary_cte AS (
	SELECT
		MIN(salary) AS min_salary
	FROM employees
) SELECT
	first_name,
    last_name,
    salary
FROM employees JOIN min_salary_cte
WHERE salary = min_salary;