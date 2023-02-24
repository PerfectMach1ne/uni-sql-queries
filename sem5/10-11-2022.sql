USE Programowanie_lab;

CREATE TABLE studenci (
	id_student INT NOT NULL PRIMARY KEY,
	imie VARCHAR(32),
	nazwisko VARCHAR(32),
	ulica VARCHAR(32),
	numer_lokalu VARCHAR(8),
	miasto VARCHAR(24),
	data_ur DATE
);

CREATE TABLE przedmioty (
	id_przedmiot INT NOT NULL PRIMARY KEY,
	nazwa_przedmiotu VARCHAR(48)
);

CREATE TABLE wykladowcy (
	id_wykladowca INT NOT NULL PRIMARY KEY,
	imie VARCHAR(32),
	nazwisko VARCHAR(32),
	ulica VARCHAR(32),
	numer_lokalu VARCHAR(8),
	miasto VARCHAR(24),
	data_ur DATE
);

CREATE TABLE egzaminy (
	id_egz INT NOT NULL PRIMARY KEY,
	id_student INT NOT NULL REFERENCES studenci(id_student),
	id_wykladowca INT NOT NULL REFERENCES wykladowcy(id_wykladowca),
	id_przedmiot INT NOT NULL REFERENCES przedmioty(id_przedmiot),
	data_egz DATE,
	ocena VARCHAR(1)
);

INSERT INTO wykladowcy(id_wykladowca, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(1, 'Arkadiusz', 'Arkadiowski', 'ul. Czerwona', '20/21', 'Lublin', '1989-02-23');
INSERT INTO wykladowcy(id_wykladowca, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(2, 'Barbara', 'Barbarowska', 'ul. Czarna', '9/10', 'Lublin', '1976-10-27'),
	(3, 'Cezary', 'Cezar', 'Aleje Rac�awickie', '7/45', 'Lublin', '1965-06-11'),
	(4, 'Barbara', 'Barbarowska', 'ul. Bia�a', '710', 'Lublin', '1977-07-10'),
	(5, 'Dariusz', 'Dariuszowicz', 'ul. Szara', '6/6', 'Lublin', '1945-06-06');

INSERT INTO studenci(id_student, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(1, 'Anna', 'Annowska', 'ul. Zielona', '23', 'Lublin', '1999-03-13'),
	(2, 'Barbara', 'Barbarowicz', 'ul. Niebieska', '88', 'Lublin', '2000-05-06'),
	(3, 'Daria', 'Dariowska', 'Aleje Rac�awickie', '4/75', 'Lublin', '2001-08-22'),
	(4, 'Anna', 'Barbarowska', 'ul. Czerwona', '71/1', 'Lublin', '1997-10-20'),
	(5, 'Jan �ukasz', 'Janowski', 'ul. Janowska', '2/3', 'Lublin', '2002-04-02');
	
INSERT INTO przedmioty(id_przedmiot, nazwa_przedmiotu)
VALUES
	(1,'Programowanie w j�zyku Java'),
	(2,'Bazy danych'),
	(3,'Wprowadzenie do Business Intelligence'),
	(4,'Statystyka z j�zykiem R'),
	(5,'Projektowanie baz danych');

INSERT INTO egzaminy(id_egz, id_student, id_wykladowca, id_przedmiot, data_egz, ocena)
VALUES
	(1, 2, 5, 1, '2021-02-15', '5'),
	(2, 5, 5, 1, '2021-02-15', '3'),
	(3, 1, 5, 1, '2021-02-15', '4'),
	(4, 4, 1, 2, '2021-02-01', '2'),
	(5, 3, 1, 2, '2021-02-11', '3'),
	(6, 2, 1, 2, '2021-02-22', '5'),
	(7, 5, 3, 5, '2021-02-18', '2'),
	(8, 3, 3, 5, '2021-02-14', '4'),
	(9, 4, 3, 5, '2021-02-14', '3'),
	(10, 1, 2, 4, '2021-02-22', '2'),
	(11, 4, 2, 4, '2021-02-22', '3'),
	(12, 5, 4, 4, '2022-01-21', '5');

SELECT * FROM studenci;
SELECT * FROM wykladowcy;
SELECT * FROM przedmioty;
SELECT * FROM egzaminy;

INSERT INTO studenci(id_student, imie, nazwisko, ulica, numer_lokalu, miasto, data_ur)
VALUES
	(6, 'Szymon', 'Szymon', 'ul. R�owa', '2/16', 'Zamo��', '1999-01-25'),
	(7, '�ukasz Jan', '�ukowicz', 'ul. Be�owa', '3/16', 'Zamo��', '2004-02-28');
-- 1.) Wyswietl imiona i nazwiska studentow ktorzy sa z miasta Lublin
SELECT imie, nazwisko FROM studenci WHERE miasto = 'Lublin';
-- 2.) Wy�wietl nazwy przedmiot�w z jakich przeprowadzono egzaminy.
SELECT DISTINCT p.id_przedmiot, nazwa_przedmiotu FROM przedmioty p, egzaminy e
WHERE p.id_przedmiot = e.id_przedmiot;
-- 3.) Wy�wietl imiona i nazwiska student�w oraz oraz liczb� zdawanych przez nich egzamin�w
SELECT s.id_student, imie, nazwisko, COUNT(id_egz) AS 'Zdane egzaminy' FROM studenci s, egzaminy e
WHERE e.id_student = s.id_student
GROUP BY s.id_student, imie, nazwisko;
-- 	4.) Wy�wietl dat� pierwszego i ostatniego egzaminu do jakiego przyst�pi� student o pewnym nazwisku.
SELECT s.id_student, MIN(data_egz) AS 'Pierwszy egzamin', MAX(data_egz) AS 'Ostatni egzamin' FROM studenci s, egzaminy e
WHERE e.id_student = s.id_student AND nazwisko = 'Janowski'
GROUP BY s.id_student;

SELECT s.id_student, data_egz FROM studenci s, egzaminy e
WHERE e.id_student = s.id_student AND nazwisko = 'Janowski';

CREATE TABLE pacjenci (
	id_pacjent INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	imie VARCHAR(32),
	nazwisko VARCHAR(32),
	ulica VARCHAR(32),
	numer_lokalu VARCHAR(8),
	miasto VARCHAR(24),
	pesel VARCHAR(11) UNIQUE
);

-- 03-11-2022
-- Unknown task #1
-- Finds the number of students taking exams
SELECT COUNT(DISTINCT(id_student)) AS 'Ilo�� student�w' FROM egzaminy;

-- Unknown task #2
-- Finds all the classes that had exams from some guy whose surname is Cezar
SELECT COUNT(DISTINCT(e.id_przedmiot))
FROM egzaminy e JOIN przedmioty p ON p.id_przedmiot = e.id_przedmiot
				JOIN wykladowcy w ON w.id_wykladowca = e.id_wykladowca
WHERE w.nazwisko = 'Cezar';

-- Unknown task #3
-- Find all examinators from early February
SELECT COUNT(DISTINCT(id_wykladowca))
FROM egzaminy
WHERE data_egz BETWEEN '2021-02-01' AND '2021-02-14';

-- Unknown task #4
-- Add opis przedmiotu column do tabeli przedmioty
ALTER TABLE przedmioty
ADD opis_przedmiotu VARCHAR(50);

-- Some new table
INSERT INTO pacjenci(imie, nazwisko, ulica, numer_lokalu, miasto, pesel)
VALUES
	('Jan', 'Kowalski', 'ul. W�glowa', '29/87', 'Szczecin', '12345678901');

INSERT INTO pacjenci(imie, nazwisko, ulica, numer_lokalu, miasto, pesel)
VALUES
	('Janusz', 'Bardziej-Kowalski', 'ul. Tlenowa', '800/8', 'Sopot', '09876543257');

SELECT * FROM pacjenci;

-- -- -- 10-11-2022
USE AdventureWorks2019 EXEC sp_changedbowner 'sa';

SELECT * FROM Person.Person;

-- Count all employees
SELECT COUNT(FirstName)
FROM Person.Person
WHERE Person.PersonType = 'EM';

-- Something
SELECT p.FirstName AS 'Imie', p.LastName AS 'Nazwisko'
FROM Person.Person p
ORDER BY p.FirstName, p.LastName DESC;

-- Imiona wszystkich kobiet
SELECT FirstName
FROM Person.Person
WHERE Title = 'Ms.';

SELECT * FROM HumanResources.Employee;

-- Poprawne?
SELECT p.FirstName
FROM Person.Person p JOIN HumanResources.Employee e
ON e.BusinessEntityID = p.BusinessEntityID
WHERE e.Gender = 'F';

SELECT p.FirstName
FROM Person.Person p JOIN HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.Gender = 'F'
ORDER BY p.FirstName;

-- Ile os�b zatrudnia firma = Liczba wszystkich pracownik�w
SELECT COUNT(FirstName) AS 'People employed'
FROM Person.Person
WHERE Person.PersonType = 'EM';

-- Nazwa klienta/kontrahenta oraz liczb� z�o�onych przez niego zam�wie�
SELECT * FROM Sales.Customer;
SELECT * FROM Sales.SalesOrderHeader;
SELECT * FROM Sales.Store;
SELECT * FROM Person.Person;

SELECT
CASE
	WHEN 
END AS 'Klient'
FROM Sales.SalesOrderHeader oh JOIN Sales.Customer c
ON c.CustomerID = oh.CustomerID
JOIN Person.BusinessEntityContact bec
ON bec.PersonID = c.PersonID
JOIN Person.Person p
ON p.BusinessEntityID = bec.BusinessEntityID
JOIN Sales.Store s
ON s.;

SELECT p.FirstName, p.LastName, COUNT(s.BusinessEntityID) AS 'Ilo�� zam�wie�'
FROM Sales.SalesPersonQuotaHistory s
JOIN Person.Person p
ON s.BusinessEntityID = p.BusinessEntityID
GROUP BY s.BusinessEntityID, p.FirstName, p.LastName;

-- Wy�wietl nazwy stanowisk na kt�re s� zatrudnieni pracownicy
SELECT * FROM HumanResources.Department
SELECT * FROM HumanResources.EmployeeDepartmentHistory ORDER BY DepartmentID
-- wrong, this select all departments where someone work. department = dzia�, stanowisko to co� innego
SELECT DISTINCT d.Name
FROM HumanResources.EmployeeDepartmentHistory h
JOIN HumanResources.Department d
ON d.DepartmentID = h.DepartmentID
ORDER BY d.Name;
-- poprawne
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

-- Oblicz �redni� warto�� zam�wie�
SELECT AVG(OrderQty * UnitPrice * (1 - UnitPriceDiscount))
AS '�r. wart. zam�wie�'
FROM Sales.SalesOrderDetail;

SELECT * FROM Sales.SalesOrderDetail

-- Oblicz najwi�ksz� i najmniejsz� warto�� zam�wienia
SELECT MIN(TotalPrice) AS 'Najmniejsza wart. zam�wienia',
	   MAX(TotalPrice) AS 'Najwi�ksza wart. zam�wienia'
FROM
	(SELECT OrderQty * UnitPrice * (1 - UnitPriceDiscount) AS TotalPrice
	 FROM Sales.SalesOrderDetail) AS TotalPrices;