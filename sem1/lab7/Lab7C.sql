SELECT
	c.contactFirstName,
    c.customerNumber,
    e.firstName,
    e.employeeNumber
FROM customers c INNER JOIN employees e
ON c.contactFirstName = e.firstName