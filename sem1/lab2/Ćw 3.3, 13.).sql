CREATE TABLE IF NOT EXISTS departments (
	department_id INTEGER NOT NULL UNIQUE,
    department_name varchar(30) NOT NULL,
    manager_id INTEGER,
    location_id INTEGER,
    PRIMARY KEY(department_id, manager_id)
);

INSERT INTO departments VALUES(19, 'SPRZEDAZ', 199, 77);
INSERT INTO departments VALUES(20, 'MAGAZYN', 199, 55);
INSERT INTO departments VALUES(21, 'ADMINISTRACJA', 212, 55);

CREATE TABLE IF NOT EXISTS employees (
	employee_id INTEGER NOT NULL PRIMARY KEY,
    first_name VARCHAR(25) DEFAULT NULL,
    last_name VARCHAR(30) NOT NULL,
    job_id VARCHAR(20) NOT NULL,
    salary DECIMAL(8,2) DEFAULT NULL,
    manager_id INTEGER DEFAULT NULL,
    department_id INTEGER DEFAULT NULL,
    FOREIGN KEY(department_id, manager_id) REFERENCES departments(department_id, manager_id)
);

INSERT INTO employees VALUES(419, 'Jan', 'Kowalski', 'CASHIER', 4999, 199, 19);
INSERT INTO employees VALUES(420, 'John', 'Kovalsky', 'STOREKEEPER', 5001, 199, 20);
INSERT INTO employees VALUES(421, 'Juan', 'de Covalsguez', 'DB_ADMIN', 999999.99, 212, 21);