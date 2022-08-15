--I worked as a SQL Developer and data analyst for a online auto parts company
--I used to help sales and marketing teams to analyze the sales and inventory of the company
--Helped the marketing team to identify sales made on daily, Weekly, Monthly and yearly bases
--used to help in designing database tables and structures and creating views, functions and stored procedures
--used to write optimized SQL queries for integration with other applications
--used to maintain database and maintain data quality

--noticing relationships between tables, walking through the columns, and seeing comments.
--Records are displayed in an ordered manner, handling NULL values, and selecting records based
--on patterns like Wildcard, Operators, etc. Then working on Data Manipulation commands(DML) for Data Analysis.
--Then taking Backup of the Table where migration is going on and use COMMIT and ROLLBACK commands.
--Then listing down distinct records, further renaming columns, and finally, listing down employee
--based on the complex nested conditions.

## From
-- (*) indicates all the columns in the orders table
-- from - is used to indicate the table that we need
select * from orders

## where
-- where is used to indicate the location of table
-- = is used to specify the exact entity in the rows
select * from orders
where orderid = '10250'

-- (<>) not equal to is used to fetch the data execpt the choosed one
select * from orders
where orderid <> '10250'

--mention the cloumn names to fetch out only mention details
select customername from orders
where orderid = '10250'

--(>,<)greater than , less than  these are used to get the data by comparing the value
SELECT * FROM products
where unitprice > 10

## null and not null

--NULL AND NULLNOT
-- These are used to filter the data by nulls in rows
select * from orders
where shipregion is NULL;

select * from orders
where shipregion is NOT NULL;

select productname,productid from products
order by categoryid  nulls first;

## order by
-- order by used to fetch the data in ascending or descending order
select productname,productid from products
order by categoryid decs;

select productname,productid from products
order by categoryid asc;

## Insert
--insert is used to add the data in to the table
insert into  employees (firstname,lastname,phone,email,salary,empid)
values ('sravan','reddy'
'9379726022',
'sravanreddy7673@gmail.com','14000','42)

## update
--update is used to edit the data timely
update employees set
phone = '9379518888'
where empid=42;

## create and delete table & commit
--it is used to createview as we need
create table emp_save as (select * from employees);

--this is used to delete the data that we created
truncate table emp_save;

--this is used when we need deleted data from the created table
insert into emp_save
select * from

## DISTINCT
-- distinct is use to eliminate the duplicates
select distinct city from customers

## CONCAT
SELECT concat(firstname||' '||lastname) from employees
where salary = '1400';