--SQL Homework Day 2 Amir Jones

--1. List all customers who live in Texas (use 
--JOINs) 
--ANSWER:5 CUSTOMERS JENNIFER, KIM, RICHARD, BRIAN, AND IAN
select *
from address
inner JOIN customer
on customer.address_id = address.address_id 
where district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name 
--we need to join payment customer and payment table 
--ANSWER: 1,514 CUSTOMERS

select * 
from customer

select *
from payment 

SELECT COUNT(payment.customer_id)
from customer
left join payment 
on customer.customer_id = payment.customer_id
where amount > 6.99;


--3. Show all customers names who have made payments over $175(use subqueries) 

select first_name, last_name, customer.customer_id, payment.amount
from customer
join payment
on customer.customer_id = payment.customer_id
where payment.amount > 175


--4. List all customers that live in Nepal (use the city 
--table) 
---cutomer -address- city-country
--ANSWER-KEVIN SCHULER 470 BOKSBURG STREET

select *
from customer

SELECT store_id,first_name,last_name,address
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
inner join country 
on city.country_id = country.country_id
where country = 'Nepal';

select *
from city 

select *
from country


--5. Which staff member had the most 
--transactions? 
---amount of payment ids with the staff id
--ANSWER: JON STEPHENS HAD 7,304 and MIKE HILLYER HAD 7,292 MAKING JON HAVE THE MOST PAYMENTS
select *
from staff

select * 
from payment

SELECT staff.first_name, staff.last_name, COUNT(payment.payment_id)
FROM staff
LEFT JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id;


--6. How many movies of each rating are 
--there? 
--select film_id, title, (rating)
--from film;
--ANSWER: PG-13 HAS 223, NC-17 HAS 210, G HAS 178, PG HAS 194, R HAS 195
select rating, count(*)
from film
group by rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)



--8. How many free rentals did our stores give away?
--ANSWER- 24 FREE RENTALS
select count(payment_id)
from payment
where amount = 0;


----DELETE FROM <table name> WHERE <condition>
---DROP TABLE <table name>;
