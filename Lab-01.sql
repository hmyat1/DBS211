/*1. How many tables have been created? List the names of the created tables.

  >>Eight tables have been created and the names of the created tables are customers,employees,offices,orderdetails,orders, payments, productlines and products.

  2.Click on table customers. Click on the Data tab near the top of the worksheet. How many rows arethere in the table customers?
  
  >> There are 122 rows in the customers table.
  
  3.  What SQL statement would return the same results. Write the statement in the .sql file and execute it.
  
  >>select * from customers; is the statement that would return the same result.
  
  4. How many columns does the customers table have? List the column names.
  
   >>Customers table have 13 columns. The name of the columns are customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesemployeenumber, creditlimit.
  
  5.What is the value of each column in the first row in table customers? Write the column name and thecolumn data type in addition to the value.

   >> The value of each column in the first row of the customers are 
     column name          column data type         value 
     customernumber       integer                  103
     customername         varchar                  Atelier graphique
     contactlastname      varchar                  Schmitt
     contactfirstname     varchar                  Carine
     phone                varchar                  40.32.2555
     addressline1         varchar                  54, rue Royale
     addressline2         not a data type          (null)
     city                 varchar                  Nantes
     state                not a data type          (null)
     postalcode           integer                  44000
     country              varchar                  France
     salesemployeenumber  integer                  1370 
     creditlimit          integer                  21000
     
  6.Write the number of rows and columns for the rest of the tables in your schema.
   Format it somethinglike the following.
   Table Name Rows Columns
   __________ _____ ________
   ________ _____ _______
  
   >>Table name                Rows                 Columns
     customers                 122                  13
     employees                 23                   8
     offices                   7                    9
     orderdetails              2996                 5
     orders                    326                  7
     payments                  273                  4
     productlines              7                    4
     products                  110                  9
   
  7.Right Click on the orderdetails table and choose tables/count rows. 
  How many rows does the orderdetails table include?

  >>The orderdetails table include 2996 rows.
  
  8.Write the following SQL statement in the new tab.
   desc offices;
   You can also write
   describe offices;
   What is the result of the statement execution?
  
   >>The result of the statement execution is 
    Name         Null?    Type         
    ------------ -------- ------------ 
    OFFICECODE   NOT NULL VARCHAR2(10) 
    CITY         NOT NULL VARCHAR2(50) 
    PHONE        NOT NULL VARCHAR2(50) 
    ADDRESSLINE1 NOT NULL VARCHAR2(50) 
    ADDRESSLINE2          VARCHAR2(50) 
    STATE                 VARCHAR2(50) 
    COUNTRY      NOT NULL VARCHAR2(50) 
    POSTALCODE   NOT NULL VARCHAR2(15) 
    TERRITORY    NOT NULL VARCHAR2(10) 
    
  9.Type the following statements in, execute them, then briefly describe what the statement is doing!
   SELECT * FROM employees;
   SELECT * FROM customer ORDER BY ContactLastName;
  
   >>SELECT * FROM employees; This statemnt selects all the columns from the table called employees.
  
   SELECT * FROM customer ORDER BY ContactLastName; This statemnt selects all the columns from the table called customers and specifies the sorting order for contactlastname.
    
 10. How many constraints does the products table have?
 
   >>The product table have 11 constraints.
 
 11.Find a way to turn on the line numbers in the gutter.

   >>To turn on the line numbers, we have to click on the white sppace and have to choose toggle line number. It will show the line numbers.
 
 12.Set the font size in the worksheet editor to a size that is best for you. (Hint: Tools/Preferences)
 
   >>I set the font size to 20.*/
