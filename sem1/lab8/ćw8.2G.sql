SELECT
	e.employee_id,
    jh.job_id,
    datediff(jh.end_date, jh.start_date) AS day_count
FROM employees e JOIN job_history jh
USING(employee_id)
WHERE jh.department_id = 90;