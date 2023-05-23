USE sakila;

#1. List the number of films per category.
SELECT c.`name` AS category, COUNT(f.film_id) AS num_films
FROM film AS f
INNER JOIN film_category AS fc
ON fc.film_id = f.film_id
INNER JOIN category AS c
ON c.category_id = fc.category_id
GROUP BY `name`
ORDER BY 1 ;

#2. Display the first and the last names, as well as the address, of each staff member.
SELECT CONCAT(first_name, ' ', last_name) AS `name`, address
FROM address AS a
INNER JOIN staff as s
ON a.address_id = s.address_id
ORDER BY 1;

#3. Display the total amount rung up by each staff member in August 2005.
SELECT CONCAT(first_name, ' ', last_name) AS `name`, SUM(amount) AS amount_rung_up
FROM payment AS p
INNER JOIN staff as s
ON p.staff_id = s.staff_id
WHERE DATE_FORMAT(payment_date, '%Y-%m') = '2005-08'
GROUP BY `name`
ORDER BY 2 DESC;

#4. List all films and the number of actors who are listed for each film
SELECT title, COUNT(fa.actor_id) AS num_actors
FROM film AS f
INNER JOIN film_actor AS fa
ON f.film_id = fa.film_id
INNER JOIN actor AS a
ON a.actor_id = fa.actor_id
GROUP BY title
ORDER BY 2 DESC;

/* 5. Using the payment and the customer tables as well as the JOIN command, list the total 
amount paid by each customer. List the customers alphabetically by their last names.*/
SELECT last_name, SUM(amount) AS amount_paid
FROM payment AS p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id
GROUP BY last_name
ORDER BY 1;