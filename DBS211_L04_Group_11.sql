-- ***********************
-- Name: Hla Myint Myat, Leon Frank, William Kim
-- ID: 185923216, 159218213 ,147854228
-- Date: 27.5.23
-- Purpose: Lab 03 DBS211
-- ***********************


--Create a new empty table employee2 the same as table employees.
-- Use a single statement to create the table and insert the data at the same time.

--Q1 Solution--
CREATE TABLE employee2 AS SELECT * FROM employees WHERE 1=0;

-- Modify table employee2 and add a new column username to this table.
-- The value of this column is not required and does not have to be unique.

--Q2 Solution--
ALTER TABLE employee2 ADD username VARCHAR(50);

--Delete all the data in the employee2 table

--Q3 Solution--
DELETE FROM employee2;

--To remove the username column in order to re-insert the data from employees table.
ALTER TABLE employee2 DROP COLUMN username;


--Re-insert all data from the employees table into your new table employee2 using a singlestatement

--Q4 Solution--
INSERT INTO employee2 SELECT * FROM employees;

--Create a statement that will insert yourself as an employee into employee2.
--(a)Use a unique employee number of your choice (Hint: Find the highest value of the employeenumber in the dbs211_employees table, increase the value by one and use it as youremployee number.)
--To find the highest value of the employee number you can sort the rows in thedescending order. The first row will then contain the highest value.Or, you can run the following statement (Do not include this statement in yoursubmission.)
--SELECT max(employeenumber)
--FROM dbs211_employees;
--This statement returns the maximum value of the employee number in tabledbs211_employees.

--(b)Use your school email address
--(c)Your extension is ‘x2222’
--(d)Your job title will be “Cashier”
--(e)Office code will be 4
--(f)You will report to employee 1088
--(g)You do not have any username

--Q5 Solution--
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES (3000, 'MYINT', 'HLA MYINT', 'x2222', 'hmyat1@myseneca.ca', 4, 1088, 'Cashier');


--Create a query that displays your, and only your, employee data.

--Q6 Solution--
SELECT * FROM employee2 
WHERE employeenumber = 3000;


--Create a statement to update your job title to “Head Cashier”.
--Hint: Be careful. You may update other rows or all rows in the employee table. You only need toupdate one row which belongs to you and update your job title. Make sure that your queryupdates only one employee using a WHERE clause.

--Q7 Solution--
UPDATE employee2
SET jobtitle = 'Head Cashier'
WHERE employeenumber = 3000;

--Create a statement to insert another fictional employee into employee2.
-- This employee will be a“Cashier” and will report to you. 
--Make up fake data for the other fields. 
--The fake employee doesnot have any username.

--Q8 Solution--
INSERT INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES (3010, 'Fake', 'Name', 'x1234', 'fakeemail@myseneca.ca', 4, 3000, 'Cashier');


--Create a statement to delete yourself from employee2. Did it work? If not, why?

--Q9 Solution--
DELETE FROM employee2
WHERE employeenumber = 3000;
--This causes a referential error as the employee 3010 also references employee 3000. The child record is found for this parent record.
--Therefore, causing a error.


--Create a statement to delete the fake employee from employee2 and then rerun the statement to delete yourself.
-- Did it work? Explain why?

--Q10 Solution--
DELETE FROM employee2
WHERE employeenumber = 3010;
DELETE FROM employee2
WHERE employeenumber = 3000;
--This worked as there are no other records that references empolyee 3000, as the child record was deleted

--Create a single statement that will insert both yourself and the fake employee at the same time.
--This time you and the fake employee will report to 1088.

--Q11 Solution--
INSERT ALL 
INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES (3000, 'MYINT', 'HLA MYINT', 'x2222', 'hmyat1@myseneca.ca', 4, 1088, 'Cashier')
INTO employee2 (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES (3010, 'Fake', 'Name', 'x1234', 'fakeemail@myseneca.ca', 4, 1088, 'Cashier')
SELECT * FROM dual;

-- Create a single statement to delete both yourself and the fake employee from employee2.

--Q12 Solution--
DELETE
FROM employee2 
WHERE employeenumber = 1703 OR employeenumber = 1704;
   
--In table employee2, generate the email address for column username for each student byconcatenating the first character of employee’s first name and the employee’s last name.
-- Forinstance, the username of employee Peter Stone will be pstone.
-- NOTE: the username is in alllower case letters.

--Q13 Solution--
UPDATE employee2
SET username = LOWER(SUBSTR(firstname,1,1) || lastname);


-- In table employee2, remove all employees with office code 4.

--Q14 Solution--
DELETE FROM employee2 WHERE office_code = 4;

--Drop table employee2.

--Q15 Solution--
DROP TABLE employee2;




