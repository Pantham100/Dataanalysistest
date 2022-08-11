##NORTHWIND##


--Display PRODUCTID, CATEGORYID, MIN UNITPRICE by Categoryid of the Products--

select productid,categoryid, min(unitprice)
over(partition by categoryid) as lowest_unit_price from products;

--Display orderid,max of quantity by orderid whose max quantity is less than 30--

create view max_sales as
SELECT
orderid,max(quantity) 
over(partition by orderid) as max_sale
from order_details;

select
orderid, max_sale 
from max_sales
where max_sale < 30

--Display productid,orderid,sum of quantity by orderid of the orderdetails--
select
productid,orderid,sum(quantity)
over(partition by orderid) as amount_of_products from order_details

--Create a view as served_cities to display employeeid,orderid and city--
create view served_cities as
select
employeeid,orderid,shipcity from orders;

##DVD RENTAL##


--Display firstname of staff and customer as person_name without missing all the entries--
select first_name as person_name from staff
union all
select first_name as person_name from customer

--Display cityid’s having same countryid--
select city_id, country_id
from city
where city_id = country_id;

--Display the actors firstname,lastname of their film title starts with C and D

select first_name, last_name
from actor a inner join film_actor f1 
on a.actor_id = f1.actor_id inner join film f2
on f1.film_id = f2.film_id 
where title like 'C%' or title like 'D%';

--reate view for the question 3 and get the count of actors acted in each film--
create view title1234 as
select first_name, last_name,title
from actor a inner join film_actor f1 
on a.actor_id = f1.actor_id inner join film f2
on f1.film_id = f2.film_id 
where title like 'C%' or title like 'D%';

select title,count(*)
from title1234 group by title;
