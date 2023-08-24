-- ***********************
-- Name: Hla Myint Myat, Leon Frank, William Kim
-- ID: 185923216,  ,14754228
-- Date: 9.6.23
-- Purpose: Lab 05 DBS211
-- ***********************

--Q1 Solution--

--ANSI-89
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM employees, offices
WHERE employees.officecode = offices.officecode
AND UPPER(country) = 'FRANCE';

--ANSI-92
SELECT employeenumber, firstname, lastname, city, phone, postalcode
FROM employees INNER JOIN offices USING (officecode)
WHERE UPPER(country) = 'FRANCE';

--Q2 Solution--
SELECT customernumber, customername, TO_CHAR (paymentdate, 'MON DD, YYYY') as paymentdate, amount
FROM customers INNER JOIN payments USING (customernumber)
WHERE UPPER(country) = 'CANADA'
ORDER BY customernumber;


--Q3 Solution--
SELECT customernumber, customername
FROM customers LEFT JOIN payments USING (customernumber)
WHERE payments.amount IS NULL
AND UPPER(country) = 'USA'
ORDER BY customernumber;


--Q4 Solution--
CREATE VIEW vwCustomerOrder AS 
SELECT customernumber, ordernumber, orderdate, productname, quantityordered, buyprice
FROM orders JOIN orderdetails USING (ordernumber) 
JOIN products ON orderdetails.productcode = products.productcode;
SELECT * FROM vwCustomerOrder;

--Q5 Solution--
SELECT * FROM vwCustomerOrder 
JOIN orderdetails USING (ordernumber) 
WHERE customernumber = 124 
ORDER BY ordernumber, orderlinenumber;


--Q6 Solution--
SELECT a.customernumber, a.contactfirstname, a.contactlastname, a.phone, a.creditlimit 
FROM customers a, ORDERS b 
WHERE a.customernumber != b.customernumber;

--Q7 Solution--
CREATE VIEW vwEmployeeManager AS
SELECT e.EmployeeID, e.FirstName, e.LastName, m.FirstName AS ManagerFirstName, m.LastName AS ManagerLastName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

--Q8 Solution--
ALTER VIEW vwEmployeeManager AS
SELECT e.EmployeeID, e.FirstName, e.LastName, m.FirstName AS ManagerFirstName, m.LastName AS ManagerLastName
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID IS NOT NULL;

--Q9 Solution--
DROP VIEW IF EXISTS customer_order;
DROP VIEW IF EXISTS employee_manager;



