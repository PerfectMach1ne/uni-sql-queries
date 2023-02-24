use sakila;

# Which actors have the first name ‘Scarlett’
select * from actor where first_name = 'Scarlett';

# Which actors have the last name ‘Johansson’
select * from actor where last_name = 'Johansson';

# How many distinct actors last names are there?
select count(distinct last_name) from actor;

# Which last names are not repeated?
select count(actor_id), last_name from actor group by last_name having count(actor_id) = 1;

# Which last names appear more than once?
select count(actor_id), last_name from actor group by last_name having count(actor_id) > 1;

# Which actor has appeared in the most films?
select actor.actor_id, actor.first_name, actor.last_name,
       count(film_id) as film_count
from actor left join film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;

# Is ‘Academy Dinosaur’ available for rent from Store 1?
select title, if(
(
	select distinct inventory.film_id
	from film join inventory
	on film.film_id = inventory.film_id
	where title = "ACADEMY DINOSAUR" and store_id = 1
), 'YES', 'NO') as is_available
from film
where title = "ACADEMY DINOSAUR";

# Insert a record to represent Mary Smith renting ‘Academy Dinosaur’ from Mike Hillyer at Store 1 today.
insert into rental(rental_date, inventory_id, customer_id, return_date, staff_id)
values(
	CURRENT_DATE(),
    (select inventory_id from inventory left join film on inventory.film_id where title = "ACADEMY DINOSAUR" and store_id = 1 limit 1),
    (select customer_id from customer where first_name = "Mary" and last_name = "Smith"),
    '2020-12-21',
    (select staff_id from staff where first_name = "Mike" and last_name = "Hillyer")
);

# When is ‘Academy Dinosaur’ due?
select inventory_id as academy_dinosaur, return_date from rental where inventory_id = 1;

# What is that average running time of all the films in the sakila DB?
select avg(length) as average_film_runtime from film;

# What is the average running time of films by category?
select category.category_id, category.name, avg(length) as average_film_runtime
from film join film_category using(film_id) join category using(category_id)
group by category.name;

# Why does this query return the empty set?
select * from film natural join inventory;
/* Tabele film i inventory mają dwie kolumny film_id oraz last_update o tych samych nazwach,
   żadna z których nie posiada jednocześnie dwóch identycznych wartości.