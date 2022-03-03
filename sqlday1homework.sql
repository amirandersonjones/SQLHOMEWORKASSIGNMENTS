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
--ANSWER: Film id 200 has 9 available copies making it the max and is called "Curtain"
select film_id, count(*)
from inventory
group by film_id
order by count(*) desc;


--4. How many customers have the last name ‘William’? 
--ANSWER: None
select first_name, last_name 
from customer 
where last_name = 'William'; 
 
--5. What store employee (get the id) sold the most rentals? 
--ANSWER: staff_id of 1 sold 7292 rentals and staff_id of 2 sold 7304 rentals making staff_id 2 have the highest amount of rentals
select *
from payment 
where staff_id = 2;

select *
from payment 
where staff_id = 1;


--6. How many different district names are there? 
--ANSWER: 603 district names
select district 
from address;


--7. What film has the most actors in it? (use film_actor table and get film_id) 8. From store_id 1, 
--ANSWER: film 508 has the most actors of 16 in it.
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;

--8. How many customers have a last name ending with ‘es’? (use customer table) 
--ANSWER: 21 customers
select last_name 
from customer
where last_name like '%es';

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  with ids between 380 and 430? (use group by and having > 250) 

--10. Within the film table, how many rating categories are there? And what rating has the most  movies total?
--Answer: There are 5 rating categories, PG-13 has the most movie totals at 223 movies, NC-17 has 210, R has 195, PG has 194, G has 178
--select *
--from film

select rating, count(title)
from film 
group by rating 
order by count(title);


