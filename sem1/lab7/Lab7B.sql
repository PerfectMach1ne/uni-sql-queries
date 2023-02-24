USE classicmodels;

# Default JOIN (INNER JOIN)
SELECT
	concat(firstName, " ", lastName) AS employeeName,
    e.officeCode
FROM employees e JOIN offices o
ON e.officeCode = o.officeCode
ORDER BY employeeName;

# INNER JOIN
SELECT
	o.orderNumber,
    o.status,
    SUM(priceEach * quantityOrdered) totalSales
FROM orders o INNER JOIN orderdetails d
USING(orderNumber)
WHERE status = 'Cancelled'
GROUP BY orderNumber;

# LEFT JOIN
SELECT
	c.customerName,
    concat(c.contactFirstName, " ", c.contactLastName) AS contactName,
    orderNumber,
    status
FROM customers c LEFT JOIN orders o
USING(customerNumber)
WHERE orderNumber IS NULL
ORDER BY c.customerName, contactName;

# RIGHT JOIN
SELECT
	concat(e.firstName, " ", e.lastName) AS employeeName,
    e.employeeNumber,
    c.customerName,
    concat(c.contactFirstName, " ", c.contactLastName) AS contactName,
    c.customerNumber
FROM customers c RIGHT JOIN employees e
ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE customerNumber > 200
ORDER BY customerNumber;

# INNER JOIN
SELECT
	concat(m.firstName, " ", m.lastName) AS manager,
    concat(e.firstName, " ", e.lastName) AS managedEmployee
FROM employees e INNER JOIN employees m
ON m.employeeNumber = e.reportsTo
ORDER BY manager;