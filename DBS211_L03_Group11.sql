-- ***********************
-- Name: Hla Myint Myat, Leon Frank, William Kim
-- ID: 185923216, 159218213 ,147854228
-- Date: 27.5.23
-- Purpose: Lab 03 DBS211
-- ***********************

--1.Display the data for all offices.
--Display office code, city, state, country, and phone for all offices.

--Q1 Solution--
SELECT officecode, city , state , country , phone 
FROM offices;


--2.Display employee number, first name, last name, and extension for all employees whose officecode is 1.
-- Sort the result based on the employee number.

--Q2 Solution--
SELECT employeenumber, firstname, lastname, extension 
FROM employees
WHERE officecode = 1
ORDER BY employeenumber;


--3.Display customer number, customer name, contact first name and contact last name, and phonefor all customers in Paris. 
--(hint: be wary of case sensitivity) Sort the result based on thecustomer number.

--Q3 Solution--
SELECT customernumber, customername, contactfirstname, contactlastname, phone
FROM customers
WHERE UPPER(city) = 'PARIS'
ORDER BY customernumber;

--4.Repeat the previous Query with a couple small changes:
--a. The contact’s first and last name should be in a single column in the format “lastname,firstname”.
--b. Show customers who are in Canada
--c. Sort the result based on the customer name.

--Q4 Solution--
SELECT customerNumber, customerName, contactLastName || ', ' || contactFirstName AS contactName, phone
FROM customers
WHERE country = 'Canada' 
ORDER BY customerName;


--5.Display customer number for customers who have payments.
-- Do not included any repeatedvalues. 
--Sort the result based on the customer number.
--Hints: How do you know a customer has made a payment?
-- You will need to access only one table for this query)
--The first 10 rows of the output result. The query returns 98 rows.

--Q5 Solution
SELECT DISTINCT customerNumber
FROM payments
ORDER BY customerNumber
FETCH NEXT 10 ROWS ONLY;


--6.List customer numbers, check number, and amount for customers 
--whose payment amount isnot in the range of $1,500 to $120,000.
-- Sort the output by top payments amount first.

--Q6 Solution
SELECT customerNumber, checkNumber, amount
FROM payments
WHERE amount NOT BETWEEN 1500 AND 120000
ORDER BY amount DESC;


--7.Display order number, order date, status, and customer number for all orders that are cancelled.
--Sort the result according to order date

--Q7 Solution
SELECT * FROM orders
WHERE UPPER(status) = 'CANCELLED';
ORDER BY orderDate;


--8. The company needs to know the percentage markup for each product sold.
-- Produce a query that outputs the ProductCode, ProductName, BuyPrice, MSRP in addition toa. 
--The difference between MSRP and BuyPrice (i.e. MSRP-BuyPrice) called markupb. 
--The percentage markup (100 * calculated by difference / BuyPrice) called percmarkuprounded to 1 decimal place.
--c. Sort the result according to percmarkup.
--d.Show products with percmarkup greater than 140

--Q8 Solution
SELECT ProductCode, ProductName, BuyPrice, MSRP, (MSRP - BuyPrice) AS markup, ROUND(((MSRP - BuyPrice) / BuyPrice) * 100, 1) AS percmarkup
FROM YourTableName
HAVING percmarkup > 140
ORDER BY percmarkup;


--9.Display product code, product name, and quantity in stock the information of all products withstring ‘co’ in their product name.
--(c and o can be lower or upper case). 
--Sort the result according to quantity in stock

--Q9 Solution
SELECT ProductCode, ProductName, QuantityInStock
FROM YourTableName
WHERE LOWER(ProductName) LIKE '%co%'
ORDER BY QuantityInStock;


--10. Display customer number, contact first name, contact last name 
--for all customers whose contactfirst name starts with letter s (both lowercase and uppercase) and includes letter e (both lowercaseand uppercase).
-- Sort the result according to customer number.

--Q10 Solution
SELECT CustomerNumber, ContactFirstName, ContactLastName
FROM YourTableName
WHERE LOWER(ContactFirstName) LIKE 's%e%'
OR UPPER(ContactFirstName) LIKE 'S%E%'
ORDER BY CustomerNumber;