CREATE TRIGGER triggerSalesOrderHeader ON Sales.SalesOrderHeader
AFTER INSERT
AS PRINT('New data was inserted');