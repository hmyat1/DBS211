-- ***********************
-- Name: Hla Myint Myat, Leon Frank, William Kim
-- ID: 185923216, 159218213 ,147854228
-- Date: 15.6.23
-- Purpose: Lab 06 DBS211
-- ***********************SET AUTOCOMMIT ON;

--1.Create table the following tables and their given constraints:

CREATE TABLE MOVIES (
mid INT PRIMARY KEY,
title VARCHAR(35) NOT NULL,
releaseYear INT NOT NULL,
director INT NOT NULL,
score DECIMAL(3,2) CHECK (score <5 AND score >0)
);

CREATE TABLE ACTORS (
aid INT PRIMARY KEY,
firstName VARCHAR(20) NOT NULL,
lastName VARCHAR(30) NOT NULL
);

CREATE TABLE CASTINGS (
movieid INT, 
actorid INT,
PRIMARY KEY (movieid, actorid),
FOREIGN KEY (movieid) REFERENCES MOVIES (mid),
FOREIGN KEY (actorid) REFERENCES ACTORS (aid)
);

CREATE TABLE DIRECTORS (
directorid INT PRIMARY KEY,
firstname VARCHAR(20) NOT NULL,
LASTNAME VARCHAR(30) NOT NULL
);

--2.Modify the movies table to create a foreign key constraint that refers to table directors.

ALTER TABLE MOVIES 
ADD CONSTRAINT FK_DIRECTORS 
FOREIGN KEY (DIRECTOR)
REFERENCES DIRECTORS (DIRECTORID);

--3.Modify the movies table to create a new constraint so the uniqueness of the movie title is guaranteed

ALTER TABLE MOVIES
ADD CONSTRAINT TITLE_UNIQUE UNIQUE (TITLE);

--4.Write insert statements to add the following data to table directors and movies.

INSERT ALL 
    INTO directors VALUES (1010, 'Rob', 'Minkoff')
    INTO directors VALUES (1020, 'Bill', 'Condon')
    INTO directors VALUES (1050, 'Josh', 'Cooley')
    INTO directors VALUES (2010, 'Brad', 'Bird')
    INTO directors VALUES (3020, 'Lake', 'Bell')
SELECT * FROM dual;

INSERT ALL
    INTO movies VALUES (100, 'The Lion King', 2019, 3020, 3.50)
    INTO movies VALUES (200, 'Beauty and the Beast', 2017, 1050, 4.20)
    INTO movies VALUES (300, 'Toy Story 4', 2019, 1020, 4.50)
    INTO movies VALUES (400, 'Mission Impossible', 2018, 2010, 5)
    INTO movies VALUES (500, 'The Secret Life of Pets', 2016, 1010, 3.90)
    SELECT * FROM dual;

--5. Write SQL statements to remove all above tables.
--   Is the order of tables important when removing? Why?

DROP TABLE castings;
DROP TABLE actors;
DROP TABLE movies;
DROP TABLE directors;

--Yes, it is important to remove the table in orders because those are linked to a parent table.
--So, we should drop the child tables first. Then only we can drop the parent table to get rid of errors. 

--6. Create a new empty table employee2 the same as table employees. 
--Use a single statement tocreate the table and insert the data at the same time.
CREATE TABLE employee2 AS (SELECT * FROM employees);
   
--7.Modify table employee2 and add a new column username to this table.
-- The value of this columnis not required and does not have to be unique
ALTER TABLE employee2 ADD username VARCHAR(10);

--8.Delete all the data in the employee2 table
DELETE FROM employee2;

--9.Re-insert all data from the employees table into your new table employee2 using a singlestatement.
INSERT INTO emplopyee2 (employeenumber, lastname, fisrtname, extension, email, officecode, reportsto, jobtitle) 
SELECT * FROM employees;

--10.In table employee2, write a SQL statement to change the first name and the last name ofemployee with ID 1002 to your name.
UPDATE employee2
SET first_name = 'Assistant', last_name = 'Assistant'
WHERE employee_id = 1002;

--11. In table employee2, generate the email address for column username for each student byconcatenating the first character of employee’s first name and the employee’s last name. Forinstance, the username of employee Peter Stone will be pstone.
-- NOTE: the username is in alllower-case letters.
UPDATE employee2
SET username = LOWER(CONCAT(LEFT(first_name, 1), last_name));

--12.In table employee2, remove all employees with office code 4.
DELETE FROM employee2
WHERE office_code = 4;

--13.Drop table employee2.
DROP TABLE employee2;




