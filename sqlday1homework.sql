--SQL DAY1 HOMEWORK QUESTIONS

--1. How many actors are there with the last name ‘Wahlberg’? 
--ANSWER: 2, Nick Wahlberg and Daryl Wahlberg
SELECT last_name, first_name
FROM actor
WHERE last_name = 'Wahlberg';

select *
from actor 
where last_name like 'Wahlberg';

select count(actor_id)
from actor 
wehre last_name like 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
--ANSWER: 5,563 payments
select amount
from payment 
where amount between 3.99 and 5.99;

select count(amount)
from payment 
where amount between 3.99 and 5.99;

--3. What film does the store have the most of? (search in inventory) 
--ANSWER: Film id 200 has 9 available copies making it the max and is called "Curtain"
select film_id, count(*)
from inventory
group by film_id
order by count(*) desc;

select film_id, count(film_id)
from inventory 
group by film_id 
order by count(film_id) desc;

--you would actually need to use this to find the film name because the table is just extra and not returned in results.
select * from film where film_id = 200;


--4. How many customers have the last name ‘William’? 
--ANSWER: None
select first_name, last_name 
from customer 
where last_name = 'William'; 
 
select count(last_name)
from customer 
where last_name like 'William';
--zero but there is 1 Williams


--5. What store employee (get the id) sold the most rentals? 
--ANSWER: staff_id of 1 sold 7292 rentals and staff_id of 2 sold 7304 rentals making staff_id 2 have the highest amount of rentals
select *
from payment 
where staff_id = 2;

select *
from payment 
where staff_id = 1;

--first we have to determine where this info is stored
select * from staff;
--this tells us who they are but no info on sales
select * from payment;
---options count of staff_ids within payments 
	---count of staff_ids within rental table
select staff_id, count(staff_id)
from payment 
group by staff_id 
order by count(staff_id) desc;

select staff_id, count(staff_id)
from rental
group by staff_id 
order by count(staff_id)desc;

--6. How many different district names are there? 
--ANSWER: 378 district names
select district 
from address;
---we have to find where this info is contained.
select district, count(district)
from address
group by district;
---based on the rows we have 378 different district names
---however there is a better way 
--use the distinct constraignt to only select unique district names
select count(distinct district)
from address;

--7. What film has the most actors in it? (use film_actor table and get film_id) , 
--ANSWER: film 508 has the most actors of 16 in it.
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;

---aka what film id appears most in this table 
select film_id , count(film_id)
from film_actor
group by film_id 
order by count(film_id)desc;

--what about the other side-what actor has appeared in the most film?
select actor_id, count(*)
from film_actor
group by actor_id 
order by count(*)desc;
--actor 107 appeared in 42 films

--8. 8. From store_id 1How many customers have a last name ending with ‘es’? (use customer table) 
--ANSWER: 13 customers
select count(customer_id)
from customer
where last_name like '%es' and store_id = 1;

--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers  
--with ids between 380 and 430? (use group by and having > 250) 
ANSWER:3 amounts
select amount, count(rental_id)
from payment 
where customer_id between 380 and 430
group by amount
having count(rental_id) > 250;
--visually I can see that we have 3 amounts with more than 250 rentals for customers with ids between 380 and 430


--10. Within the film table, how many rating categories are there? And what rating has the most  movies total?
--Answer: There are 5 rating categories, PG-13 has the most movie totals at 223 movies, NC-17 has 210, R has 195, PG has 194, G has 178
--select *
--from film

select rating, count(title)
from film 
group by rating 
order by count(title);

select count(distinct rating)
from film;
---5 different rating categories 
select rating, count(*)
from film 
group by rating
order by count(*) des;


