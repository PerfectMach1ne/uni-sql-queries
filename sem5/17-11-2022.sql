USE AdventureWorks2019;

-- Ilu pracownik�w jest zatrudnionych w firmie
SELECT COUNT(BusinessEntityID) 'Zatrudnieni pracownicy'
FROM HumanResources.Employee;
-- Wy�wietl nazw� klienta zamawiaj�cego, kt�rzy z�o�y� zam�wienie na najwi�ksz� kwot�
SELECT TOP 1
	soh.CustomerID,
	p.FirstName + ' ' + p.LastName AS 'CustomerName',
	MAX(TotalDue) AS MaxPayment
FROM
	Sales.SalesOrderHeader soh
	JOIN Sales.Customer sc
	ON sc.CustomerID = soh.CustomerID
	JOIN Person.BusinessEntity be
	ON be.BusinessEntityID = sc.PersonID
	JOIN Person.Person p
	ON p.BusinessEntityID = be.BusinessEntityID
GROUP BY soh.CustomerID, p.FirstName, p.LastName	
ORDER BY MaxPayment DESC;
-- zadeklaruj zmienn�
DECLARE @zmienna INT = 10;
SELECT
	FirstName + ' ' + LastName AS 'PersonName'
FROM
	HumanResources.Employee e JOIN Person.Person p
	ON p.BusinessEntityID = e.BusinessEntityID
WHERE Gender = 'F' AND e.BusinessEntityID < @zmienna;