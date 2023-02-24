CREATE TABLE jobs (
	job_id INT UNIQUE NOT NULL,
    job_title VARCHAR(15),
    min_salary DECIMAL(8,2),
    max_salary DECIMAL(8,2)
    CHECK (max_salary <= 25000),
    PRIMARY KEY (job_id)
);