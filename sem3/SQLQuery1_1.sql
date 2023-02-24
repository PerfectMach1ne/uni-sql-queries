USE AdventureWorks2017;

UPDATE Person.Person
SET FirstName = 'Anna'
WHERE FirstName = 'K%';

SELECT
	FirstName,
	LastName
FROM Person.Person pp JOIN HumanResources.Employee hre
ON pp.BusinessEntityID = hre.BusinessEntityID
WHERE Gender = 'F'
ORDER BY
	FirstName,
	LastName;

--  hfsdghfj POLECEN IE 3

SELECT TOP 15
	FirstName,
	LastName
FROM Person.Person pp JOIN HumanResources.Employee hre
ON pp.BusinessEntityID = hre.BusinessEntityID
WHERE LastName = 'Anderson'
ORDER BY FirstName;