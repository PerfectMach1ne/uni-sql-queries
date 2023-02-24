# Baza danych "Magazyn"
# Niektore tabele i atrybuty w j. angielskim, gdyz ulatwia mi to pisanie skryptow.

CREATE DATABASE IF NOT EXISTS magazyn;
USE magazyn;

# Tworzenie tabel

CREATE TABLE IF NOT EXISTS locations (
	location_id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(40),
    district VARCHAR(40),
    town VARCHAR(40),
    address VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS buildings (
	building_number INT NOT NULL,
    location_id INT NOT NULL,
    PRIMARY KEY (building_number, location_id),
    FOREIGN KEY (location_id)
		REFERENCES locations(location_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS departments (
	department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(25) NOT NULL,
    building_number INT NOT NULL,
    FOREIGN KEY (building_number)
		REFERENCES buildings(building_number)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS jobs (
	job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_name VARCHAR(20) NOT NULL,
    pay DECIMAL(8,2) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id)
		REFERENCES departments (department_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS employees (
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
	employeed_since DATE DEFAULT (CURRENT_DATE()),
    job_id INT NOT NULL,
    CONSTRAINT fk_employees_jobs
    FOREIGN KEY (job_id)
		REFERENCES jobs (job_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS assortment (
	object_id INT(6) ZEROFILL AUTO_INCREMENT PRIMARY KEY,
    object_name VARCHAR(50) NOT NULL,
    department_id INT NOT NULL,
    weight DECIMAL(7,2) DEFAULT 0.0,
    size_class ENUM('Tiny', 'Small', 'Medium', 'Large', 'Extremely Large'),
    additional_info TINYTEXT,
    in_storage_since DATE DEFAULT (CURRENT_DATE()),
    FOREIGN KEY (department_id)
		REFERENCES departments (department_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(30) DEFAULT "Single person",
    first_name VARCHAR(35) NOT NULL,
    last_name VARCHAR(35) NOT NULL,
    location_id INT NOT NULL,
    stored_object INT(6) ZEROFILL NOT NULL,
    FOREIGN KEY (location_id)
		REFERENCES locations (location_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (stored_object)
		REFERENCES assortment (object_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS transactions (
	transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    accountant_id INT, # Ksiegowy
    paid_amount DECIMAL(9,2) NOT NULL,
    transaction_date DATE NOT NULL DEFAULT (CURRENT_DATE()),
    FOREIGN KEY (customer_id)
		REFERENCES customers (customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (accountant_id)
		REFERENCES employees (employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

# ZAPYTANIE 1 (typu ALTER TABLE)
# Zmiana nazwy kolumny "pay" w tabeli "jobs" na "job_salary" i dodanie jednej cyfry do zakresu atrybutu (zeby mozna bylo miec milion PLN).
ALTER TABLE jobs
CHANGE COLUMN pay job_salary DECIMAL(9,2) NOT NULL;

# WSTAWIANIE DANYCH

INSERT INTO locations (country, district, town, address)
VALUES
	('Poland', 'Lubelskie', 'Lublin', 'al. Wincentego Witosa 56'),
    ('Poland', 'Lubelskie', 'Lublin', 'al. Wincentego Witosa 57'),
    ('Poland', 'Lubelskie', 'Swidnik', 'ul. Jana III Sobieskiego 1'),
    ('Poland', 'Mazowieckie', 'Warszawa', 'ul. Labedzia 2/67'),
    ('Poland', 'Pomorskie', 'Sopot', 'Armii Krajowej 19/232'),
    ('Poland', 'Mazowieckie', 'Warszawa', 'ul. Polna 45'),
    ('Czechy', 'Praga', 'Praga', 'ul. Nerudova 234'),
    ('USA', 'Pennsylvania', 'Philadelphia', 'American St. 404'),
    ('USA', NULL, 'Washington, D.C.', 'First St.');

INSERT INTO buildings (building_number, location_id)
VALUES
	(1, 2),
    (2, 2),
    (4, 2),
    (5, 6),
    (7, 6),
    (11, 7);

INSERT INTO departments (department_name, building_number)
VALUES
	('Zywnosc', 1),
    ('Leki', 1),
    ('Leki', 11),
    ('Metale', 7),
    ('Maszyny i pojazdy', 4),
    ('Maszyny i pojazdy', 5),
    ('Materialy budowlane', 4),
    ('Materialy budowlane', 7),
    ('Odziez', 11),
    ('Paczki i listy', 2),
	('Biuro', 4);

INSERT INTO jobs (job_name, job_salary, department_id)
VALUES
	('Magazynier', 5000.0, 12),
    ('Magazynier', 5200.0, 20),
    ('Magazynier', 4800.0, 15),
    ('Magazynier', 4900.0, 13),
    ('Magazynier', 3700.0, 19),
    ('Magazynier', 5500.0, 14),
    ('Ksiegowy', 14000.0, 21),
    ('Portier', 3300.0, 12),
    ('Portier', 2700.0, 11),
    ('Portier', 2400.0, 17),
    ('Listonosz', 3500.0, 20),
    ('Kierowca', 12837.99, 11),
    ('Kierowca', 9900.50, 20),
    ('Kierowca', 11000.0, 19),
    ('Kierowca', 7000.0, 13),
    ('Szef', 1000000.01, 21);

INSERT INTO employees (first_name, last_name, employeed_since, job_id)
VALUES
    ('Jan', 'Kowalski', '1987-05-07', 16),
	('Gustaw', 'Kozlowski', '2016-09-16', 1),
    ('Bartek', 'Bartkowski', '2005-05-05', 15),
    ('Milosz', 'Wojciechowski', '2018-06-06', 3),
    ('Jakub', 'Sokolowski', '2012-12-12', 5),
    ('Anna', 'Nowak', '2010-06-07', 7),
    ('Roman', 'Romanski', '1998-10-10', 12),
    ('Dariusz', 'Szybki', '1998-10-12', 13),
    ('Wladyslaw', 'Wladyslawowicz', '2009-10-21', 8),
    ('Dmitri', 'Ivanov', '2017-11-17', 6),
    ('Adam', 'Nowak', '2001-01-19', 11),
    ('Szymon', 'Szymanski', '1995-08-21', 9),
    ('Ryszard', 'Mroz', '2020-04-13', 10),
    ('Dominik', 'Jasinski', '2019-03-03', 2),
    ('John', 'Speed', '1989-02-08', 14),
    ('Arkadiusz', 'Jakubowski', '2004-04-14', 4);

INSERT INTO assortment (object_name, department_id, weight, size_class, additional_info, in_storage_since)
VALUES
	('Kadm', 14, 507.70, 'Large', 'Toksyczny metal ciezki','2020-05-12'),
    ('Herbata', 11, 7.50, 'Medium', 'Przechowywac w suchym pomieszczeniu', '2021-03-28'),
    ('Przesylka', 20, 1.25, 'Small', 'Polecona', '2021-05-28'),
    ('Tabletki przeciwbolowe', 12, 5.0, 'Tiny', NULL, '2020-12-27'),
    ('Koszulki', 19, 4.33, 'Small', NULL, '2020-12-28'),
    ('Szyby do okien', 17, 73.50, 'Medium', 'Moga ulec zbiciu', '2019-04-17'),
    ('Ciezarowka', 16, 15700.50, 'Extremely Large', NULL, '2015-09-05'),
    ('Prasa hydrauliczna', 15, 1052.85, 'Large', NULL, '2020-05-17'),
    ('Cement', 17, 250.20, 'Medium', NULL, '2020-09-21'),
    ('Ziemniaki', 11, 220.43, 'Medium', 'Przechowywac w chlodni; termin waznosci: 2021-12-20', '2021-04-10');

INSERT INTO customers (customer_name, first_name, last_name, location_id, stored_object)
VALUES
    ('Fabryka Pojazdow Ciezkich SA', 'Borys', 'Chlebek', 1, 000007),
    ('Electrical Ltd.', 'John', 'Kovalsky', 8, 000001),
    ('President of the United States', 'Barack', 'Obama', 9, 000002),
    ('Akademia Maszyn Ciezkich', 'dr hab. Albert', 'Uczony', 4, 000008);
# Demonstracja dzialania DEFAULT
INSERT INTO customers (first_name, last_name, location_id, stored_object)
VALUES
	('Aneta', 'Podolska', 3, 000003),
    ('Wladyslawa', 'Swierczek', 5, 000004);

INSERT INTO transactions (customer_id, accountant_id, paid_amount, transaction_date)
VALUES
	(5, NULL, 6.00, '2021-05-12'),
    (3, 6, 1000.00, '2021-03-12'),
    (1, 6, 270.20, '2015-09-05'),
    (4, NULL, 8888.23, '2020-03-02'),
    (6, 6, 27.15, '2020-11-30'),
	(2, 6, 155020.89, '2020-04-18');

# Zapytania SELECT

# ZAPYTANIE 2 - wyswietla wszystkie prace z przypisanymi im dzialami
SELECT department_name, job_name FROM departments d
JOIN jobs j ON d.department_id = j.department_id
GROUP BY department_name, job_name
ORDER BY department_name ASC;

# ZAPYTANIE 3 - wyswietla wszystkich pracownikow poza szefem z zarobkami ponad srednia zarobkow (nie liczac zarobkow szefa)
SELECT
	employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    job_salary
FROM employees e LEFT JOIN jobs j
ON e.job_id = j.job_id
WHERE job_salary >= (
	SELECT
		AVG(job_salary)
		FROM jobs j RIGHT JOIN employees e
	ON j.job_id = e.job_id
	WHERE employee_id > 1) AND employee_id > 1;

# ZAPYTANIE 4 - wyswietla wszystkich pracownikow lub klientow z imieniem rozpoczynajacym sie na 'Jx', gdzie x jest dowolna litera.
SELECT
	people.person_name
FROM (SELECT
		CONCAT(first_name, ' ', last_name) AS person_name
	FROM employees
    UNION
    SELECT
		CONCAT(first_name, ' ', last_name) AS person_name
	FROM customers) people
WHERE people.person_name LIKE 'J_%';

# ZAPYTANIE 5 - wyswietla wszystkich pracownikow zatrudnionych w 20 wieku i ich prace i dzialy.
SELECT
    employeed_since,
	employee_id,
    e.job_id,
    department_id
FROM employees e INNER JOIN jobs
USING(job_id)
WHERE employeed_since < '2000-01-01'
ORDER BY employeed_since;

# ZAPYTANIE 6 - Zwraca srednia wage poszczegolnych klas rozmiaru i ilosc obiektow danej klasy rozmiaru
SELECT
	size_class,
	AVG(weight),
    COUNT(*)
FROM assortment
GROUP BY size_class
ORDER BY size_class;

# ZAPYTANIE 7 - Odczytuje date waznosci ziemniakow z notatki
# Data w notatce jest na koncu i ma dlugosc 11 znakow (2021-12-20)
# Funkcja LENGTH zwraca pozycje tuz przed data, odejmujac 10 znakow od dlugosci tekstu
# Kolejno funkcja SUBSTRING odcina czesc tekstu znajdujaca sie przed data, i zwraca pozostala date.
SELECT
	SUBSTRING(additional_info, (LENGTH(additional_info) - 10), 11) AS potato_expiration_date
FROM
	assortment
WHERE object_name = 'Ziemniaki';

SELECT additional_info FROM assortment WHERE object_name = 'Ziemniaki';
# ZAPYTANIE 8 - Zwraca imiona pracownikow, nazwy dzialow w ktorych pracuja, budynkow poszczegolnych dzialow oraz pelne adresy tych budynkow
SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    b.building_number,
	CONCAT(country, ', ', district, ', ', address, ' ', town) building_location
FROM employees e JOIN jobs
USING(job_id)
JOIN departments d
USING(department_id)
JOIN buildings b
USING(building_number)
JOIN locations
USING(location_id);

# ZAPYTANIE 9 - Zwraca wszystkie transakcje, ktore nastapily tego samego dnia, w ktorym dodano obiekt do magazynu
SELECT
	transaction_id,
	transaction_date
FROM transactions
WHERE transaction_date = ANY (
	SELECT
		in_storage_since
	FROM assortment
);

# ZAPYTANIE 10 - Zwraca pracownikow z najwieksza i najmniejsza placa
SELECT
	employee_id,
	CONCAT(first_name, ' ', last_name) AS employee_name,
    job_salary
FROM employees JOIN jobs
USING(job_id)
WHERE job_salary = (
	SELECT
		MAX(job_salary)
	FROM jobs
	) OR job_salary = (
    SELECT
		MIN(job_salary)
	FROM jobs
);

# ZAPYTANIE 11 - Zwraca imiona klienta oraz ksiegowego klienta, ktorzy zamowili przechowanie herbaty w magazynie
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    CONCAT(e.first_name, ' ', e.last_name) AS accountant_name,
    stored_object
FROM transactions t JOIN customers c
USING(customer_id)
JOIN assortment a
ON c.stored_object = a.object_id
JOIN employees e
ON t.accountant_id = e.employee_id
WHERE object_name = 'Herbata';

# ZAPYTANIE 12 - Wyswietla wszystkich kierowcow oraz ich dzialy i place
SELECT
	CONCAT(first_name, ' ', last_name) AS driver_name,
    department_name,
    job_salary
FROM employees RIGHT JOIN jobs
USING(job_id)
JOIN departments
USING(department_id)
WHERE job_name = 'Kierowca'
ORDER BY driver_name;