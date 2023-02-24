CREATE TRIGGER triggerHREmployee ON HumanResources.Employee
AFTER DELETE
AS PRINT('Deleted an employee');