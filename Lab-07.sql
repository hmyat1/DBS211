-- ***********************
-- Name: Hla Myint Myat, Leon Frank, William Kim
-- ID: 185923216, 159218213 ,147854228
-- Date: 8.7.23
-- Purpose: Lab 07 DBS211
-- ***********************

--1.List the 4 ways that we know that a transaction can be started.

--1.By creating a blank sheet connecting to the server
--2.BEGIN statement
--3.COMMIT statement saves the current transaction and starts a new one
--4.By Executing data definition language DDL statements which triggers the auto commit

--2.Using SQL, create an empty table, that is the same as the employees table, and name it newEmployees.

CREATE TABLE newEmployees (
    employeenumber INT PRIMARY KEY NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    firstname VARCHAR (50) NOT NULL,
    extention VARCHAR (10) NOT NULL ,
    email VARCHAR (100) NOT NULL,
    officecode VARCHAR (10) NOT NULL,
    reportsto VARCHAR (38),
    jobtitle VARCHAR (50) NOT NULL);
    
--3.Execute the following commands.

    SET AUTCOMMIT OFF;
    SET TRANSACTION READ WRITE;

--4.Write an INSERT statement to populate the newEmployees table with the rows of the sample data.
--Insert the NULL value for the reportsTo column. (Write a single INSERT statement to insert all the rows).

INSERT ALL 
INTO newEmployees VALUES(100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
INTO newEmployees VALUES(101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
INTO newEmployees VALUES(102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
INTO newEmployees VALUES(103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
INTO newEmployees VALUES(104, 'Ropebur', 'Audrey', '77888', 'arepebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM dual;

--5.Create a query that shows all the inserted rows from the newEmployees table. 
--How many rows are selected?

SELECT * FROM newEmployees;
--5 rows are selected.

--6.Execute the rollback command. Display all rows and columns from the newEmployees table. 
--How manyrows are selected?

ROLLBACK;
SELECT * FROM newEmployees;
--No Rows are selected.

--7.Repeat Task 4.
--Make the insertion permanent to the table newEmployees.
--Display all rows and columns from the newEmployee table. 
--How many rows are selected?

INSERT ALL 
INTO newEmployees VALUES(100, 'Patel', 'Ralph', '22333', 'rpatel@mail.com', '1', NULL, 'Sales Rep')
INTO newEmployees VALUES(101, 'Denis', 'Betty', '33444', 'bdenis@mail.com', '4', NULL, 'Sales Rep')
INTO newEmployees VALUES(102, 'Biri', 'Ben', '44555', 'bbirir@mail.com', '2', NULL, 'Sales Rep')
INTO newEmployees VALUES(103, 'Newman', 'Chad', '66777', 'cnewman@mail.com', '3', NULL, 'Sales Rep')
INTO newEmployees VALUES(104, 'Ropebur', 'Audrey', '77888', 'arepebur@mail.com', '1', NULL, 'Sales Rep')
SELECT * FROM dual;

COMMIT;

SELECT * FROM newEmployees;

--5 rows are selected.

--8.Write an update statement to update the value of column jobTitle to ‘unknown’ for all the employees in the newEmployees table.

UPDATE newEmployees 
SET jobtitle = 'unknown';

--9.Make your changes permanent.
COMMIT;

--10.Execute the rollback command.
ROLLBACK;

--a.Display all employees from the newEmployees table whose job title is ‘unknown’. 
--How manyrows are still updated?

SELECT * FROM newEmployees;
--All rows are updated and there are no changes.

--b.Was the rollback command effective?
--No, it was not effective.

--c.What was the difference between the result of the rollback execution from Task 6 and theresult of the rollback execution of this task?
--The main difference is that we didn't commit in task 6 and for this first we commit it and then rollback so the rollback is not effective now.


    







