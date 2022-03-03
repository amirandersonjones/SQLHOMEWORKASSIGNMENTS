--SQL DAY1 HOMEWORK QUESTIONS

--1. How many actors are there with the last name ‘Wahlberg’? 
--ANSWER: 2, Nick Wahlberg and Daryl Wahlberg
SELECT last_name, first_name
FROM actor
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--ANSWER: 5,563 payments
select amount
from payment 
where amount between 3.99 and 5.99;

--3. What film does the store have the most of? (search in inventory) 
--select  count(inventory_id)
from inventory


--4. How many customers have the last name ‘William’? 
--ANSWER: None
select first_name, last_name 
from customer 
where last_name = 'William'; 
 
--5. What store employee (get the id) sold the most rentals? 

--6. How many different district names are there? 
--ANSWER: 603 district names
select district 
from address;


--7. What film has the most actors in it? (use film_actor table and get film_id) 8. From store_id 1, 

--8. How many customers have a last name ending with ‘es’? (use customer table) 
--ANSWER: 21 customers
select last_name 
from customer
where last_name like '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250) 

--10. Within the film table, how many rating categories are there? And what rating has the most  movies total?
--Answer: There are 5 rating categories
--select *
--from film
