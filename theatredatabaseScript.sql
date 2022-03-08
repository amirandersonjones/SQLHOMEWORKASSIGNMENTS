create table theatre(
	store_id serial primary key,
	theatre_name varchar(100) not null,
	address varchar(150)
);

insert into theatre(theatre_name, address)
values('Hillcrest Theatre', '768 Dogrest St. chicago il 60653');

insert into theatre(theatre_name, address)
values('Trumps Theatre', '234 Main St. chicago heights il 60643');

insert into theatre(theatre_name, address)
values('Watch Pary Cinema', '657 east end ave. chicago il 60643');

insert into theatre(theatre_name, address)
values('Threes Company Theatre', '956 Muskeegon St. chicago il 60693');


select * from theatre

create table products(
	product_id serial primary key,
	product_name varchar(100),
	product_vendor varchar(100)
);

insert into products (product_name, product_vendor)
values('M&Ms', 'Mars' );

insert into products (product_name, product_vendor)
values('pepsi', 'Pepsicola' );

insert into products (product_name, product_vendor)
values('coca cola', 'Coca Cola' );

insert into products (product_name, product_vendor)
values('gummi bears', 'Albanese Candy Factory' );

insert into products (product_name, product_vendor)
values('Slurpie', '7 Eleven' );

insert into products (product_name, product_vendor)
values('bucket of popcorn', 'ActII' );

insert into products (product_name, product_vendor)
values('Nachos', 'Doritos' );


select * from products


create table concessions(
	receipt_number serial primary key,
	store_id int not null,
	foreign key (store_id) references theatre (store_id),
	product_id int not null,
	foreign key (product_id) references products (product_id)
);


insert into concessions(store_id, product_id)
values(1, 10);

insert into concessions(store_id, product_id)
values(3, 5);

insert into concessions(store_id, product_id)
values(2, 7);

insert into concessions(store_id, product_id)
values(1, 10);

insert into concessions(store_id, product_id)
values(4, 10);

insert into concessions(store_id, product_id)
values(1, 6);

select *from concessions

create table movies(
	movie_id serial primary key,
	movie_name varchar(150) not null,
	release_date date
);

insert into movies(movie_name, release_date)
values('The Color Purple', '1985-12-18');

insert into movies(movie_name, release_date)
values('The Help', '2011-08-10');

insert into movies(movie_name, release_date)
values('The Secret Life of Bees', '2008-10-17');

insert into movies(movie_name, release_date)
values('Moonlight', '2016-09-02');

insert into movies(movie_name, release_date)
values('Love Jones', '1997-03-14');

insert into movies(movie_name, release_date)
values('Passing', '2021-10-27');

insert into movies(movie_name, release_date)
values('Fences', '2016-12-15');


select * from movies

create table customers(
	customer_id serial primary key,
	first_name varchar(150),
	last_name varchar(150),
	email varchar(150),
	phone bigint 
);

insert into customers(first_name, last_name, email, phone)
values('Craig', 'Mack', 'craigmack@aol.com', 2194569738);

insert into customers(first_name, last_name, email, phone)
values('Mary', 'Poppins', 'mp@yahoo.com', 7734569738);

insert into customers(first_name, last_name, email, phone)
values('Jack', 'Spratt', 'js@gmail.com', 8474569738);

insert into customers(first_name, last_name, email, phone)
values('Jessica', 'Brown', 'jb@gmail.com', 6544569738);

insert into customers(first_name, last_name, email, phone)
values('Bobby', 'Whitney', 'bobbywhitney@gmail.com', 7754569738);

delete from customers
where first_name = 'Craig';

delete from customers
where first_name = 'Mary';


alter table customers
alter column phone
type text;

select * from customers



drop table tickets;


create table tickets(
	ticket_id serial primary key,
	customer_id int not null,
	foreign key (customer_id) references customers(customer_id),
	store_id int not null,
	foreign key (store_id) references theatre (store_id),
	movie_id int not null,
	foreign key (movie_id) references movies(movie_id),
	movie_name varchar(250) 
);



insert into tickets(customer_id, store_id, movie_id, movie_name)
values(5, 4, 5, 'The Help');

insert into tickets(customer_id, store_id, movie_id, movie_name)
values(9, 2, 1, 'The Color Purple');

insert into tickets(customer_id, store_id, movie_id, movie_name)
values(7, 1, 10, 'Fences');

select * from tickets