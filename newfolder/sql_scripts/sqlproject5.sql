--I worked as a SQL Developer and data analyst for a online auto parts company
--I used to help sales and marketing teams to analyze the sales and inventory of the company
--Helped the marketing team to identify sales made on daily, Weekly, Monthly and yearly bases
--used to help in designing database tables and structures and creating views, functions and stored procedures
--used to write optimized SQL queries for integration with other applications
--used to maintain database and maintain data quality

--This project involves data analysis using different SQL functions like ROW_NUMBER, RANK, DENSE_RANK, SUBSTR, INSTR
--COALESCE and NVL. It also involves the use of some built-in functions like concat, upper, lower, initcap, rtrim,
--ltrim, length, lpad, rpad.

##ROW_NUMBER
--The ROW_NUMBER() is a window function that assigns a sequential integer number to each row in the query’s result set
--the ORDER BY clause sorts the rows in each partition. Because the ROW_NUMBER() is an order sensitive function, the
--ORDER BY clause is required
-- the PARTITION BY clause divides the result set returned from the FROM clause into partitions.
select row_number() over(order by contactname) as rankkk,
companyname,contacttitle,address,city,region,country,phone
from customers

select employeeid|| ' ' || row_number() over(PARTITION by employeeid order by hiredate) as rankk, t.*
from employees t;
## Rank
--ROW_NUMBER and RANK are similar. ROW_NUMBER numbers all rows sequentially (for example 1, 2, 3, 4, 5).
--RANK provides the same numeric value for ties (for example 1, 2, 2, 4, 5).
SELECT
productid,productname,unitprice,RANK () OVER ( ORDER BY productid DESC) prudct
FROM products;

## DENSE_RANK
--This function returns the rank of each row within a result set partition, with no gaps in the ranking values.
--The rank of a specific row is one plus the number of distinct rank values that come before that specific row.
SELECT
productid,productname,unitprice,dense_RANK () OVER ( ORDER BY productid DESC) prudct
FROMproducts;

##concat
--concat is used to combine the two column data
--and also we add the external data to all the columns
select upper(concat(firstname,' ',lastname)) as fullname,lower(concat(title, ' king'))as tilts
initcap(concat(title, ' king'))as int_tilts from employees

## TRIM
-- it is used to trim the space that present a sides of the data
select upper(concat(firstname,' ',lastname)) as fullname,trim(concat(firstname,' ',lastname)) as fulllname from employees
select lower(concat(firstname,' ',lastname)) as fullname,ltrim('concat(firstname,' ',lastname) ') as fulllname from employees
select lower(concat(firstname,' ',lastname)) as fullname,rtrim('concat(firstname,' ',lastname) ') as fulllname from employees

##distinct
--The DISTINCT keyword in the SELECT clause is used to eliminate duplicate rows and display a unique list of values.
--In other words, the DISTINCT keyword retrieves unique values from a table
select distinct sal from emp

##substring
-- it is used to seperate the date from the row and form an another row with seperated data
select phone,SUBSTRING(phone,1,9)from address
select phone,SUBSTRING(phone,9)from address
##instring
--it is used to know the position of the letter that we need..when all were in the same formate in the column
select phone,INSTRING(phone,'6',1,4)from address

##coalesce
--The SQL server's Coalesce function is used to handle the Null values. The null values are replaced with user-defined
--values during the expression evaluation process. This function evaluates arguments in a particular order from the
--provided arguments list and always returns the first non-null value.
SELECT COALESCE(NULL, NULL, NULL,'Anil', NULL, 'Pantham')

##Date_formate
--this is used to change the formate of date
select empno,ename,job,hiredate,to_char(hiredate,'DD/MM/YY') from emp
select empno,ename,job,hiredate,to_char(hiredate,'DD/MON/YYYY') from emp