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

insert into cars(vin, make, model, color, year)
values('922D9DF97D48GHS4D', 'honda', 'ridgeline', 'black', '2022');

insert into cars(vin, make, model, color, year)
values('9PFD9DF97D48GHS4D', 'jeep', 'cherokee', 'white', '2020');

insert into cars(vin, make, model, color, year)
values('0P9DF97D48GHS8Y4D', 'chevrolet', 'maxima', 'purple', '2019');

insert into cars(vin, make, model, color, year)
values('YT67N97D48GHS8Y4D', 'chevrolet', 'cobalt', 'red', '2019');

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

insert into parts_inventory(part_name, brand)
values('brake drums', 'monroe');

insert into parts_inventory(part_name, brand)
values('power steering fluid', 'prestone');

insert into parts_inventory(part_name, brand)
values('coolant', 'prestone');

insert into parts_inventory(part_name, brand)
values('tires r22.5 radials', 'bridgestone');

insert into parts_inventory(part_name, brand)
values('power steering pump', 'cardone');

insert into parts_inventory(part_name, brand)
values('windshield', 'general motors');

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
	--column name data type constraints
	invoice_ID serial primary key,
	car_ID Int not null,
	foreign key(car_id) references cars(car_id),
	salesperson_id int not null,
	foreign key (salesperson_id) references sales_person(salesperson_id),
	invoice_date varchar(150) not null,
	price int
);

insert into invoice(car_id, salesperson_id, invoice_date, price)
values(1, 5, 'August 1 2022', 5);

insert into invoice(car_id, salesperson_id, invoice_date, price)
values(6, 5, 'September 5 1999', 10);

insert into invoice(car_id, salesperson_id, invoice_date, price)
values(3, 4, 'February 4 2021', 100);

select *
from invoice;


create table customer(
	customer_id serial primary key,
	car_id int not null,
	foreign key (car_id) references cars(car_id),
	first_name varchar(150),
	last_name varchar(150),
	email varchar(150),
	phone text
);

drop table customer;

insert into customer(car_id, first_name, last_name, email, phone)
values(6, 'Craig', 'Paul', 'craigp@gmail.com', 7733849876);

insert into customer(car_id, first_name, last_name, email, phone)
values(3, 'Minnie', 'Aplois', 'ap@gmail.com', 219957697);

insert into customer(car_id, first_name, last_name, email, phone)
values(2, 'Simon', 'Perry', 'simoneperry@yahoomail.com', 8471849876);

insert into customer(car_id, first_name, last_name, email, phone)
values(1, 'Kellie', 'Chandley', 'kcp@sbcglobal.com', 5849876);

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

drop table service_ticket;

insert into service_ticket(car_id, part_id, service_done, price)
values(6, 3, 'tire rotation', 30);

insert into service_ticket(car_id, part_id, service_done, price)
values(6, 1, 'transmission rebuild', 2530);

insert into service_ticket(car_id, part_id, service_done, price)
values(1, 5, 'coolant flush', 230);

insert into service_ticket(car_id, part_id, service_done, price)
values(1, 4, 'power steering flush', 250);


select * from service_ticket

create table mechanics_service(
	service_id int not null, 
	foreign key (service_id) references service_ticket(service_id), 
	mechanic_id int not null,
	foreign key (mechanic_id) references mechanics(mechanic_id)
);

insert into mechanics_service(mechanic_id,service_id)
values(7, 3);

insert into mechanics_service(mechanic_id,service_id)
values(3, 1);

insert into mechanics_service(mechanic_id,service_id)
values(1, 2);

insert into mechanics_service(mechanic_id,service_id)
values(5, 4);

drop table mechanics_service;

select * from mechanics_service 

