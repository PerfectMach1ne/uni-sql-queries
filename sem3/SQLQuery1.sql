use AdventureWorks2017;

-- POLECENIE #1
SELECT
	BusinessEntityID id,
	FirstName first_name,
	LastName last_name
FROM Person.Person
WHERE PersonType = 'EM'
ORDER BY id;

SELECT DISTINCT PersonType FROM Person.Person;

-- POLECENIE #2
/* Wyœwietl 5 pierwszych pracowników, których nazwiska rozpoczynaj¹ siê na literê 'a'. */

SELECT TOP 5
	FirstName first_name,
	LastName last_name
FROM Person.Person
WHERE PersonType LIKE 'EM' AND FirstName LIKE 'a%';

-- POLECENIE #3
/* Wyœwietl listê stanowisk */

SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

-- POLECENIE #4
/* Wyœwietl informacje o zamowieniu, wartosc zamowiennia ALE o najwiekszej wartosci */

SELECT
	od.SalesOrderID order_id,
	od.ProductID product_id,
	(od.UnitPrice * od.OrderQty) paid_price
FROM Sales.SalesOrderHeader oh INNER JOIN Sales.SalesOrderDetail od
ON od.SalesOrderID = oh.SalesOrderID
WHERE (od.UnitPrice * od.OrderQty) IN 
(	SELECT
		MAX( (od.UnitPrice * od.OrderQty) )
	FROM
		Sales.SalesOrderDetail od);

SELECT TOP 1
	SalesOrderID order_id,
	SUM(UnitPrice * OrderQty) paid_price
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;

SELECT * FROM Sales.SalesOrderDetail;
SELECT * FROM Sales.SalesOrderHeader;

select top 1 SalesOrderID, sum(UnitPrice * OrderQty) as 'wartosc' from Sales.SalesOrderDetail group by SalesOrderID order by 'wartosc' desc;

-- POLECENIE #5
-- Wyswielt ID oraz ilosc pozycji zamowienia o najwiekszej ilosci pozycji

SELECT TOP 1
	SalesOrderID order_id,
	COUNT(SalesOrderID) as 'sales_count'
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY 'sales_count' DESC;

-- POLECENIE #6
-- Policz ile pracownikow pracuje w poszczegolnych dzia³ach

SELECT * FROM HumanResources.Employee;
SELECT * FROM HumanResources.EmployeeDepartmentHistory;
SELECT * FROM HumanResources.Department;

SELECT
	dp.DepartmentID department_id,
	dp.Name department_name,
	COUNT(edh.BusinessEntityID) employee_count
FROM HumanResources.Department dp JOIN HumanResources.EmployeeDepartmentHistory edh
ON dp.DepartmentID = edh.DepartmentID
GROUP BY dp.DepartmentID, dp.Name
ORDER BY
	employee_count DESC,
	department_name;

-- POLECENIE #7
-- Wyswietl zamowienia które maja DOK£ADNIE dwie pozycje

SELECT
	SalesOrderID sale_id,
	COUNT(SalesOrderID) sale_count
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(SalesOrderID) = 2
ORDER BY SalesOrderID;

-- POLECENIE #8
-- Ktora kategoria zawiera najwiecej produktow

-- todo khekhekhe

-- POLECENIE #9
-- oblicz srednia wartosc zamowien

SELECT
	SalesOrderID sale_id,
	AVG(UnitPrice) avg_price
FROM
	Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY
	avg_price DESC,
	sale_id;

select avg(TotalDue) from Sales.SalesOrderHeader;

SELECT
	AVG(TotalDue) AS price_mean
FROM Sales.SalesOrderHeader;

-- perspektywa ograniczajaca widok do wyswietlenia pierwszego i ostatniego zamowienia