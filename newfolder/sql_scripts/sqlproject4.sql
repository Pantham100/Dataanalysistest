--I worked as a SQL Developer and data analyst for a online auto parts company
--I used to help sales and marketing teams to analyze the sales and inventory of the company
--Helped the marketing team to identify sales made on daily, Weekly, Monthly and yearly bases
--used to help in designing database tables and structures and creating views, functions and stored procedures
--used to write optimized SQL queries for integration with other applications
--used to maintain database and maintain data quality


--This project involves the data analysis using WITH clause, the difference between COUNT(*) and COUNT(column_name),
--Categorization using the CASE statement, and various real-life case problem statements.

##difference Between count(*) and count(cloumn)
--when we use count * it gives the data of the null rows too.
--inorder to fetch the data and remove the null we use null column
select productid, count(*)
from products
group by productid

select productid,count(),count(reorderlevel)
from products
group by productid


##categerization
--it is used to group the data by using conditions we can compare the data as client need
select last_name,length(last_name),
case
when length(last_name) > 0
and length(last_name) <= 4 THEN 'SHORT'
WHEN length(last_name) > 4
AND length(last_name) <= 6 THEN 'MEDIUM'
WHEN length(last_name) > 6 THEN 'LONG'
END AS namelength
FROM actor
ORDER BY length(last_name);

##with
--The SQL WITH clause allows you to give a sub-query block a name (a process also called sub-query refactoring),
--which can be referenced in several places within the main SQL query
WITH amountt as (select min(amount) as amountt from customer c inner join payment p on c.customer_id = p.customer_id)
select c.first_name, min(amount) as amountt
from customer c inner join payment p on c.customer_id = p.customer_id,amountt
group by (c.first_name)

## GET details without using analytical functions like max, min
-- row number gives the specific number for each row by that we can fetch the details needed
select * from emP
(select sal from emp
group by sal
order by sal desc)
WHERE ROWNUM = 1;

## listtagg
-- it is used to get the details of different rows in one row
--in other words it operates on all rows and returns a single output row.
select country from employees
listagg(city,',') within group(order by city) as town
group by country
order by country;

