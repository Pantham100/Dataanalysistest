--I worked as a SQL Developer and data analyst for a online auto parts company
--I used to help sales and marketing teams to analyze the sales and inventory of the company
--Helped the marketing team to identify sales made on daily, Weekly, Monthly and yearly bases
--used to help in designing database tables and structures and creating views, functions and stored procedures
--used to write optimized SQL queries for integration with other applications
--used to maintain database and maintain data quality


--This project involves the data analysis using Sub-query, Group-by clause and
--Exists clause. It also consists of using inline view and aggregate functions
--(Min, Max, Count, Avg) to perform better analysis on data.

##sub-query
--A subquery is a query that appears inside another query statement. Subqueries are also referred to as
--sub- SELECT s or nested SELECT s.
--(note)--The full SELECT syntax is valid in subqueries.
SELECT first_name,customerid
FROM customers c
WHERE customerid =
    (SELECT customerid
     FROM c.customers
     WHERE [first_name] = 'Chainring Bolts' );

##group-by
--The GROUP BY command is used to group the result set (used with aggregate functions: COUNT, MAX, MIN, SUM, AVG).

--##regular group by
SELECT COUNT(customerid), country
FROM customers
GROUP BY country

##Groupby using COUNT, MAX, MIN, SUM, AVGg
-- anything can be used instead of sum & Min to fetch the required detials that client needs
--having can be used instead of where clause in aggregate function

select categoryname, sum(unitsinstock) as totalcost
from categories c inner join products p on c.categoryid = p.categoryid
group by categoryname
having sum(unitsinstock) > 500

select productid, categoryid, min(unitprice) over
(partition by categoryid) as price from products;