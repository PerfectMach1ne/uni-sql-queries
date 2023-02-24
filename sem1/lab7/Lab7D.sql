USE sakila;

SELECT
	country,
	city
FROM city JOIN country
ON city.country_id = country.country_id
GROUP BY country;

# JOIN Z 4 TABELAMI
SELECT
	concat(first_name, " ", last_name) AS customer_name,
	district,
    city,
    country
FROM customer INNER JOIN address
USING(address_id)
INNER JOIN city
USING(city_id)
INNER JOIN country
USING(country_id)
WHERE country LIKE '%Republic%'
ORDER BY country, city, district;

SELECT
	concat(first_name, " ", last_name) AS actor_name,
    film_id
FROM actor LEFT JOIN film_actor
USING(actor_id)
ORDER BY actor_name;
# FILM ATOR <-> FILM

SELECT
	film.film_id,
    actor_id
FROM film_actor RIGHT JOIN film
USING(film_id)
ORDER BY film_id DESC;

SELECT 
	concat(first_name, " ", last_name) AS customer_name,
    return_date
FROM rental LEFT JOIN customer
USING(customer_id);

SELECT
	concat(first_name, " ", last_name) AS staff_name,
    store.manager_staff_id AS manager_id,
    store.store_id
FROM store JOIN staff
ON store.store_id = staff.store_id;