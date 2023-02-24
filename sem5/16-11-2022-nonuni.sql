SELECT
	GETDATE() AS SystemTime,
	DATEPART(YEAR, GETDATE()) AS SystemYear,
	YEAR(GETDATE()) AS SystemYear2,
	DATEPART(MONTH, GETDATE()) AS SystemMonth,
	MONTH(GETDATE()) AS SystemMonth2;

USE AdventureWorks2019;

SELECT
	OrderDate,
	DATEADD(YEAR, -1, OrderDate) AS PreviousYear -- Subtract 1 year from date
FROM
	Sales.SalesOrderHeader;

SELECT
	OrderDate,
	ShipDate,
	DATEADD(DAY, 3, OrderDate) AS PreviousYear, -- Add 3 days as a "due date"
	DATEDIFF(DAY, OrderDate, ShipDate) AS DaysToShip,
	DATEDIFF(MONTH, OrderDate, GETDATE()) AS MonthSinceOrder
FROM
	Sales.SalesOrderHeader
ORDER BY
	DaysToShip; -- ASC is default

-- Best practice for SQL >>AND<< PowerBI/DAX to write a query against your database
-- and extract exactly the data you want and perform expressions during that operation
-- so that you don't have to clean and transform the data inside of the database.