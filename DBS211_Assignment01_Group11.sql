-- ***********************
-- Name: Hla Myint Myat, Leon Frank, William Kim
-- ID: 185923216, 159218213 ,147854228
-- Date: 9.6.23
-- Purpose: Assignment 01 DBS211
-- ***********************

--Q1 Solution--
SELECT
   e.employeenumber,
   e.lastname || ', ' || e.firstname AS "Employee Name",
   o.phone,
   e.extension,
   o.city,
   e.reportsto AS "Manager Id" 
FROM
   employees e 
   JOIN
      offices o USING (officecode) 
      
WHERE
   e.reportsto IS NULL
ORDER BY
   o.city,
   e.employeenumber;
   
--Q2 Solution--
SELECT
   e.employeenumber,
   e.lastname || ' ' || e.firstname as "Employee Name",
   o.phone,
   e.extension,
   o.city
FROM
   employees e 
   JOIN
      offices o USING (officecode) 
WHERE
   UPPER(o.city) = 'NYC' 
   OR UPPER(o.city) = 'LONDON' 
   OR UPPER(o.city) = 'PARIS' 
ORDER BY
   o.city,
   e.employeenumber;
   

--Q3 Solution--
SELECT
   e.employeenumber
   e.lastname || ' ' || e.firstname AS "Employee Name",
   o.phone,
   e.extension,
   o.city,
   e.reportsto AS "Manager Id"
   m.lastname || ', ' || m.firstname AS "Manager Name"
FROM
   employees e 
   JOIN
   offices o USING (officecode),
   employees m
WHERE
   (
      UPPER(o.city) = 'NYC'
      OR UPPER (o.city) = 'LONDON'
      OR UPPER(o.city) = 'PARIS'
   )
   AND e.reportsto = m.employeenumber
ORDER BY
   o.city,
   e.eployeenumber;

--Q4 Solution--
SELECT
   m.managerid,
   m.lastname || ', ' || m.firstname AS "Manager Name",
   o.country,
   m.reportsto AS "Manager Id" 
FROM
   employees m 
   JOIN
      offices o USING (officecode) 
WHERE
   m.reportsto = m.managerid

ORDER BY
   m.managerid;
   
--Q5 Solution--
SELECT
    c.customernumber,
    c.customername,
    od.productcode,
    p.msrp AS oldprice,
    (p.msrp * 0.9) AS newprice
FROM
    dbs211_customers c
    INNER JOIN dbs211_orders o ON c.customernumber = o.customernumber
    INNER JOIN dbs211_orderdetails od ON o.ordernumber = od.ordernumber
    INNER JOIN dbs211_products p ON od.productcode = p.productcode
WHERE
    od.quantityordered > 55
    AND p.productcode IN (
        SELECT productcode FROM dbs211_products WHERE productvendor = 'Exoto Designs'
    )
ORDER BY
    c.customernumber;
    
--Q6 SOLUTION--
--a)
    c.customernumber,
    c.customername
FROM
    dbs211_customers c
    INNER JOIN dbs211_orders o ON c.customernumber = o.customernumber
GROUP BY
    c.customernumber,
    c.customername
HAVING
    COUNT(o.ordernumber) > 1
ORDER BY
    c.customernumber;

--b) 
    c.customernumber,
    c.customername
FROM
    dbs211_customers c
    INNER JOIN dbs211_orders o ON c.customernumber = o.customernumber
GROUP BY
    c.customernumber,
    c.customername
HAVING
    COUNT(o.ordernumber) = 1
ORDER BY
    c.customernumber,
    c.customername;
