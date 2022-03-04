----AMIR JONES WEEK 4 ERD ASSIGNMENT SUBMISSION

create table Cars(
	car_id serial primary key,
	VIN VARCHAR(50) not null,
	Make varchar(150),
	Model varchar(150),
	color varchar(150),
	year integer
);

insert into cars(vin, make, model, color, year)
values('9DFD9DF97DFD5SS4D', 'ford', 'contour', 'white', '1997');

insert into cars(vin, make, model, color, year)
values('9DFD9DF97D48GHS4D', 'pontiac', 'grand prix', 'green', '1999');


select *from Cars

create table parts_inventory(
	part_ID serial primary key,
	part_name varchar(150) not null,
	brand varchar(150) 	
);

insert into parts_inventory(part_name, brand)
values('transmission', 'eaton fuller');

insert into parts_inventory(part_name, brand)
values('shocks', 'monroe');

select * from parts_inventory

create table sales_person(,
	salesperson_id serial primary key,
	first_name varchar(150),
	last_name varchar(150)
); 

insert into sales_person(first_name, last_name)
values('stuart little', 'clyde barrow');

insert into sales_person(first_name, last_name)
values('biggie', 'smalls');

insert into sales_person(first_name, last_name)
values('john', 'doe');

insert into sales_person(first_name, last_name)
values('tupac', 'shakur');

select * from sales_person

create table mechanics(
	mechanic_id serial primary key,
	first_name varchar(150),
	last_name varchar(150)
);

insert into mechanics(first_name, last_name)
values('Heavy', 'D');

insert into mechanics(first_name, last_name)
values('Oprah', 'Winfrey');

insert into mechanics(first_name, last_name)
values('Thomas', 'Jefferson');

insert into mechanics(first_name, last_name)
values('Meek', 'Mills');

insert into mechanics(first_name, last_name)
values('Angelina', 'Bradford');

insert into mechanics(first_name, last_name)
values('Kevin', 'Craig');

insert into mechanics(first_name, last_name)
values('Effie', 'Thomas');

insert into mechanics(first_name, last_name)
values('Mike', 'Jones');

select * from mechanics


create table Invoice(
	column name data type constraints
	invoice_ID serial primary key,
	car_ID Int not null,
	foreign key(car_id) references cars(car_id),
	salesperson_id int not null,
	foreign key (salesperson_id) references sales_person(salesperson_id),
	invoice_date varchar(150) not null,
	price int
);

select * from invoice

create table customer(
	customer_id serial primary key,
	car_id int not null,
	foreign key (car_id) references cars(car_id),
	first_name varchar(150),
	last_name varchar(150),
	email varchar(150),
	phone int
);

select * from customer

create table service_ticket(
	service_id serial primary key,
	car_id int not null,
	foreign key (car_id) references cars(car_id),
	part_id int not null, 
	foreign key (part_id) references parts_inventory(part_id),
	service_done varchar(150),
	price numeric(8,2)
);

select * from service_ticket

create table mechanics_service(
	service_id int not null, 
	foreign key (service_id) references service_ticket(service_id), 
	mechanic_id int not null,
	foreign key (mechanic_id) references mechanics(mechanic_id)
);

insert into mechanics_service(mechanic_id)
values('2');

select * from mechanics_service 

