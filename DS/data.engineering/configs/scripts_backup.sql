----------------------------------------------------------------------------------------
---- TRANSFORM - UNIFIED DATA MODEL 
----------------------------------------------------------------------------------------

-- oops
select a.*, 
b.name, b.address, b.phone, b."zip code", b.city, b.country, 
c.name, c.address, c.phone, c.city, c.country, c.sid,
d.rental_date, d.rental_duration, d.inventory_id
from payment a
join customer b on b.id  = a.customer_id 
join staff c on c.id = a.staff_id 
join rental d on d.rental_id = a.rental_id;

-- recreate rental table
create table rentals (rental_id bigint, rental_date text, inventory_id bigint, customer_id bigint, return_date text, staff_id bigint);
insert into rentals(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id) select * from rental;
drop table rental;

-- no more errors
select a.*, 
b.name, b.address, b.phone, b."zip code", b.city, b.country, 
c.name, c.address, c.phone, c.city, c.country, c.sid,
d.rental_date, d.return_date, d.inventory_id
from payment a
join customer b on b.id  = a.customer_id 
join staff c on c.id = a.staff_id 
join rentals d on d.rental_id = a.rental_id;

-- rename columns
select a.*, 
b.name, b.address, b.phone, b."zip code" as zip_code, b.city, b.country, 
c.name as staff_name, c.address as staff_address, c.phone as staff_phone, c.city as staff_city, c.country as staff_country, c.sid,
d.rental_date, d.return_date, d.inventory_id
from payment a
join customer b on b.id  = a.customer_id 
join staff c on c.id = a.staff_id 
join rentals d on d.rental_id = a.rental_id;

-- join store and inventory table
select a.*, 
b.name, b.address, b.phone, b."zip code" as zip_code, b.city, b.country, 
c.name as staff_name, c.address as staff_address, c.phone as staff_phone, c.city as staff_city, c.country as staff_country, c.sid,
d.rental_date, d.return_date, d.inventory_id,
e.address as store_address, e.district as store_district, e.city as store_city,
f.film_id 
from payment a
join customer b on b.id  = a.customer_id 
join staff c on c.id = a.staff_id 
join rentals d on d.rental_id = a.rental_id
join store e on e.store_id = c.sid
join inventory f on f.inventory_id = d.inventory_id;

-- add primary keys and create indexes
-- customer table
alter table customer rename to old_customer;
create table "customer"(
  "id" text,
  "name" text,
  "address" text,
  "zip code" text,
  "phone" text,
  "city" text,
  "country" text,
  "notes" text,
  constraint customer_pk primary key (id)
);
insert into customer select * from old_customer;
drop table old_customer;

-- staff table
alter table staff rename to old_staff;
create table staff (
	"id" bigint, 
	name text, 
	address text, 
	phone bigint, 
	city text, 
	country text, 
	"sid" bigint,
	constraint staff_pk primary key (id)
);
insert into staff select * from old_staff;
drop table old_staff;

-- rentals table
alter table rentals rename to old_rentals;
create table rentals ( 
	rental_id bigint, 
	rental_date text, 
	inventory_id bigint, 
	customer_id bigint, 
	return_date text, 
	staff_id bigint,
	constraint rentals_pk primary key (rental_id)
);
insert into rentals select * from old_rentals;
drop table old_rentals;

-- store table
alter table store rename to old_store;
create table store (
	store_id bigint, 
	address text, 
	district text, 
	city text,
	constraint store_pk primary key (store_id)
);
insert into store select * from old_store;
drop table old_store;

-- inventory table
alter table inventory rename to old_inventory;
create table "inventory"(
	"inventory_id" text,
	"film_id" text,
	constraint inventory_pk primary key (inventory_id)
);
insert into inventory select * from old_inventory;
drop table old_inventory;

-- film table
alter table film rename to old_film;
create table film (
	film_id integer,
	title varchar(27),
	description varchar(130),
	release_year integer,
	language_id integer,
	original_language_id varchar(1),
	rental_duration integer,
	rental_rate real,
	"length" integer,
	replacement_cost real,
	rating varchar(5),
	special_features varchar(54),
	constraint film_pk primary key (film_id)
);
insert into film select * from old_film;
drop table old_film;

-- language table
alter table language rename to old_language;
create table "language" (
	language_id integer,
	name varchar(8),
	constraint language_pk primary key (language_id)
);
insert into language select * from old_language;
drop table old_language;

-- category table
alter table category rename to old_category;
create table "category" (
	category_id integer,
	name varchar(11),
	constraint category_pk primary key (category_id)
);
insert into category select * from old_category;
drop table old_category;

-- actor table
alter table actor rename to old_actor;
create table actor (
	actor_id integer,
	first_name varchar(11),
	last_name varchar(12),
	constraint actor_pk primary key (actor_id)
);
insert into actor select * from old_actor;
drop table old_actor;

-- index creation
create index "id_customers" on "payment" ("customer_id" asc);
create index "id_staff" on "payment" ("staff_id" asc);
create index "id_rental" on "payment" ("rental_id" asc);
create index "id_store" on "staff" ("sid" asc);
create index "id_inventory" on "rentals" ("inventory_id" asc);

create index "id_film" on "inventory" ("film_id" asc);
create index "id_language" on "film" ("language_id" asc);
create index "id_film_category" on "film_category" ("film_id" asc);
create index "id_category" on "film_category" ("category_id" asc);
create index "id_film_actor" on "film_actor" ("film_id" asc);
create index "id_actor" on "film_actor" ("actor_id" asc);

-- reindex
reindex payment;
reindex staff;
reindex rentals;

reindex inventory;
reindex film;
reindex film_category;
reindex film_actor;

-- join store and inventory table - 2nd try
select a.*, 
b.name, b.address, b.phone, b."zip code" as zip_code, b.city, b.country, 
c.name as staff_name, c.address as staff_address, c.phone as staff_phone, c.city as staff_city, c.country as staff_country, c.sid,
d.rental_date, d.return_date, d.inventory_id,
e.address as store_address, e.district as store_district, e.city as store_city,
f.film_id 
from payment a
join customer b on b.id  = a.customer_id 
join staff c on c.id = a.staff_id 
join rentals d on d.rental_id = a.rental_id
join store e on e.store_id = c.sid
join inventory f on f.inventory_id = d.inventory_id;

-- join film, language, category and actor tables
select a.film_id, a.title, a.description, a.release_year, a.rental_duration, a.rental_rate, a.length, a.replacement_cost, a.rating, a.special_features,
b.name as language, 
d.name as category, 
f.first_name || ' ' || f.last_name as actor -- this is how concat is made in sqlite, for other db's use concat()
from film a
join language b on b.language_id = a.language_id
join film_category c on c.film_id = a.film_id
join category d on d.category_id = c.category_id
join film_actor e on e.film_id = a.film_id
join actor f on f.actor_id = e.actor_id;

-- join film, language, category and actor tables with group_concat
select a.film_id, a.title, a.description, a.release_year, a.rental_duration, a.rental_rate, a.length, a.replacement_cost, a.rating, a.special_features,
b.name as language, 
d.name as category, 
group_concat(f.first_name || ' ' || f.last_name) as actor
from film a
join language b on b.language_id = a.language_id
join film_category c on c.film_id = a.film_id
join category d on d.category_id = c.category_id
left join film_actor e on e.film_id = a.film_id
left join actor f on f.actor_id = e.actor_id
group by a.film_id;

-- view creation
create view  joined_data as
select first.*, second.*
from
	(select a.*, 
	b.name, b.address, b.phone, b."zip code" as zip_code, b.city, b.country, 
	c.name as staff_name, c.address as staff_address, c.phone as staff_phone, c.city as staff_city, c.country as staff_country, -- c.sid,
	d.rental_date, d.return_date, -- d.inventory_id,
	e.address as store_address, e.district as store_district, e.city as store_city,
	f.film_id 
	from payment a
	join customer b on b.id  = a.customer_id 
	join staff c on c.id = a.staff_id 
	join rentals d on d.rental_id = a.rental_id
	join store e on e.store_id = c.sid
	join inventory f on f.inventory_id = d.inventory_id) as first
join
	(select a.film_id, a.title, a.description, a.release_year, a.rental_duration, a.rental_rate, a.length, a.replacement_cost, a.rating, a.special_features,
	b.name as language, 
	d.name as category, 
	group_concat(f.first_name || ' ' || f.last_name) as actor
	from film a
	join language b on b.language_id = a.language_id
	join film_category c on c.film_id = a.film_id
	join category d on d.category_id = c.category_id
	left join film_actor e on e.film_id = a.film_id
	left join actor f on f.actor_id = e.actor_id
	group by a.film_id) as second 
on second.film_id = first.film_id;

select * from joined_data;

-- join all together - too slow
-- select a.*, 
-- b.name, b.address, b.phone, b."zip code" as zip_code, b.city, b.country, 
-- c.name as staff_name, c.address as staff_address, c.phone as staff_phone, c.city as staff_city, c.country as staff_country,
-- d.rental_date, d.return_date,
-- e.address as store_address, e.district as store_district, e.city as store_city,
-- f.film_id,
-- g.film_id, g.title, g.description, g.release_year, g.rental_duration, g.rental_rate, g.length, g.replacement_cost, g.rating, g.special_features,
-- h.name as language, 
-- j.name as category, 
-- group_concat(l.first_name || ' ' || l.last_name) as actor 
-- from payment a
-- join customer b on b.id  = a.customer_id 
-- join staff c on c.id = a.staff_id 
-- join rentals d on d.rental_id = a.rental_id
-- join store e on e.store_id = c.sid
-- join inventory f on f.inventory_id = d.inventory_id
-- join film g on g.film_id = f.film_id 
-- join language h on h.language_id = g.language_id
-- join film_category i on i.film_id = g.film_id
-- join category j on j.category_id = i.category_id
-- left join film_actor k on k.film_id = g.film_id
-- left join actor l on l.actor_id = k.actor_id
-- group by g.film_id;

----------------------------------------------------------------------------------------
---- TRANSFORM - DATA
----------------------------------------------------------------------------------------

-- select everything from view
select * from joined_data;

-- select count of movies by category using view
select category, count(film_id) as total 
from joined_data 
group by category
order by total desc;

-- create temp table
create temporary table temp as
    select * from joined_data;

-- select count of movies by category using temp table
select category, count(film_id) as total 
from temp 
group by category
order by total desc;

-- format payment_date
select a.payment_id, a.customer_id, a.staff_id, a.rental_id, a.amount,  substr(replace(payment_date, 'T', ' '), 0, 20) as payment_date, --one line changed
b.name, b.address, b.phone, b."zip code" as zip_code, b.city, b.country, 
c.name as staff_name, c.address as staff_address, c.phone as staff_phone, c.city as staff_city, c.country as staff_country, 
d.rental_date, d.return_date, 
e.address as store_address, e.district as store_district, e.city as store_city,
f.film_id 
from payment a
join customer b on b.id  = a.customer_id 
join staff c on c.id = a.staff_id 
join rentals d on d.rental_id = a.rental_id
join store e on e.store_id = c.sid
join inventory f on f.inventory_id = d.inventory_id;

-- null verification
select * from
(select count(film_id) as rental_id from temp where rental_id is null) ,
(select count(film_id) as amount from temp where amount is null) ,
(select count(film_id) as payment_date from temp where payment_date is null) ,
(select count(film_id) as name from temp where name is null) ,
(select count(film_id) as address from temp where address is null) ,
(select count(film_id) as phone from temp where phone is null) ,
(select count(film_id) as zip_code from temp where zip_code is null) ,
(select count(film_id) as city from temp where city is null) ,
(select count(film_id) as country from temp where country is null) ,
(select count(film_id) as staff_name from temp where staff_name is null) ,
(select count(film_id) as staff_address from temp where staff_address is null) ,
(select count(film_id) as staff_phone from temp where staff_phone is null) ,
(select count(film_id) as staff_city from temp where staff_city is null) ,
(select count(film_id) as staff_country from temp where staff_country is null) ,
(select count(film_id) as rental_date from temp where rental_date is null) ,
(select count(film_id) as return_date from temp where return_date is null) ,
(select count(film_id) as store_address from temp where store_address is null) ,
(select count(film_id) as store_district from temp where store_district is null) ,
(select count(film_id) as store_city from temp where store_city is null) ,
(select count(film_id) as title from temp where title is null),
(select count(film_id) as description from temp where description is null) ,
(select count(film_id) as release_year from temp where release_year is null) ,
(select count(film_id) as rental_duration from temp where rental_duration is null) ,
(select count(film_id) as rental_date from temp where rental_date is null) ,
(select count(film_id) as length from temp where length is null) ,
(select count(film_id) as replacement_cost from temp where replacement_cost is null) ,
(select count(film_id) as rating from temp where rating is null) ,
(select count(film_id) as special_features from temp where special_features is null) ,
(select count(film_id) as language from temp where language is null) ,
(select count(film_id) as category from temp where category is null) ,
(select count(film_id) as actor from temp where actor is null) ;

-- null correction
select a.film_id, a.title, a.description, a.release_year, a.rental_duration, a.rental_rate, a.length, a.replacement_cost, a.rating, a.special_features,
b.name as language, 
d.name as category, 
iif(first_name is null, 'No Information', group_concat(f.first_name || ' ' || f.last_name)) as actor --one line changed
from film a
join language b on b.language_id = a.language_id
join film_category c on c.film_id = a.film_id
join category d on d.category_id = c.category_id
left join film_actor e on e.film_id = a.film_id
left join actor f on f.actor_id = e.actor_id
group by a.film_id;

-- finalize
drop view joined_data;

create view  joined_data as
select first.*, second.*
from
    (select a.payment_id, a.customer_id, a.staff_id, a.rental_id, a.amount,  substr(replace(payment_date, 'T', ' '), 0, 20) as payment_date,
    b.name, b.address, b.phone, b."zip code" as zip_code, b.city, b.country, 
    c.name as staff_name, c.address as staff_address, c.phone as staff_phone, c.city as staff_city, c.country as staff_country,
    d.rental_date, d.return_date,
    e.address as store_address, e.district as store_district, e.city as store_city,
    f.film_id 
    from payment a
    join customer b on b.id  = a.customer_id 
    join staff c on c.id = a.staff_id 
    join rentals d on d.rental_id = a.rental_id
    join store e on e.store_id = c.sid
    join inventory f on f.inventory_id = d.inventory_id) as first
join
    (select a.film_id, a.title, a.description, a.release_year, a.rental_duration, a.rental_rate, a.length, a.replacement_cost, a.rating, a.special_features, -- a.film_id removed
    b.name as language, 
    d.name as category, 
    iif(first_name is null, 'No Information', group_concat(f.first_name || ' ' || f.last_name)) as actor
    from film a
    join language b on b.language_id = a.language_id
    join film_category c on c.film_id = a.film_id
    join category d on d.category_id = c.category_id
    left join film_actor e on e.film_id = a.film_id
    left join actor f on f.actor_id = e.actor_id
    group by a.film_id) as second 
on second.film_id = first.film_id;

-- recreate temp table
drop table temp;

create temporary table temp as
    select * from joined_data;
	
----------------------------------------------------------------------------------------
---- LOAD
----------------------------------------------------------------------------------------