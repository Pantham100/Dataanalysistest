--I worked as a SQL Developer and data analyst for a online auto parts company
--I used to help sales and marketing teams to analyze the sales and inventory of the company
--Helped the marketing team to identify sales made on daily, Weekly, Monthly and yearly bases
--used to help in designing database tables and structures and creating views, functions and stored procedures
--used to write optimized SQL queries for integration with other applications
--used to maintain database and maintain data quality



This project’s Agenda involves Analyzing the data using SQL on the Oracle Database Software. Understanding
different types of Joins(Inner join, Left join, Right join, Full join, Self join), different
types of Operators(Minus, Union, Union all, Intersect).

## inner join
--Inner join returns only those records from the tables that match the specified condition and hides other rows and columns.
--In simple words, it fetches rows when there is at least one match of rows between the tables is found.
--INNER JOIN keyword joins the matching records from two tables. It is assumed as a default join, so it is optional to use the INNER keyword with the query.

select categoryname, sum(unitsinstock) as totalcost
from categories c inner join products p on c.categoryid = p.categoryid
group by categoryname

## right join
--The Right join is used to retrieve all rows from the right-hand table and only those rows from the other table that fulfilled the join condition.
--It returns all the rows from the right-hand side table even though there are no matches in the left-hand side table. If it finds unmatched records
--from the left side table, it returns a Null value. This join is also known as Right Outer Join

SELECT o.orderid, e.LastName, e.FirstName
FROM orders
RIGHT JOIN employees ON o.employeeid = e.employeeid
ORDER BY o.orderid;

## left join
--The Left Join is used to fetch all rows from the left-hand table and common records between the specified tables. It returns all the rows from the
--left-hand side table even though there are no matches on the right-hand side table. If it will not find any matching record from the right side table,
--then it returns null. This join can also be called a Left Outer Join.

SELECT contactname
from customers c inner join orders o on
c.customerid = o.customerid;

## Full join
--The Full Join results from a combination of both left and right join that contains all the records from both tables. It fetches rows when there
--are matching rows in any one of the tables. This means it returns all the rows from the left-hand side table and all the rows from the right-hand
--side tables. If a match is not found, it puts NULL value. It is also known as FULL OUTER JOIN

select categoryname,categoryid,productname
from categories c outer join products p on c.categoryid = p.categoryid

## Self join
--A SELF JOIN is used to join a table with itself. This join can be performed using table aliases, which allow us to avoid repeating the same table
--name in a single sentence. It will throw an error if we use the same table name more than once in a single query without using table aliases.

SELECT employee.Id, employee.fullname,employee.managerId,
        manager.fullname as managername
FROM employees employee
JOIN employees manager
ON employee.managerId = manager.Id

## Minus
--This operator returns the records from the first query, which is not found in the second query. It does not return duplicate values.
--The following syntax illustrates the MINUS operator

SELECT firstname, productname , units
FROM order
MINUS
SELECT firstname, productname, units
FROM products

## union
--The UNION command combines the result set of two or more SELECT statements (only distinct values)
SELECT city FROM customers
UNION
SELECT city FROM suppliers
ORDER BY city

##Union all
--The UNION ALL command combines the result set of two or more SELECT statements (allows duplicate values).
SELECT city FROM customers
UNION ALL
SELECT city FROM suppliers
ORDER BY city

##INTERSECT
--This operator combines two select statements and returns only the dataset that is common in both the statements
