-- Week 5 - Wednesday Questions
-- 1. List all customers who live in Texas (use JOINs)
-- ANSWER: RUN CODE
-- CODE:
SELECT customer.first_name, customer.last_name, address.district
FROM address
JOIN customer
ON address.address_id = customer.address_id
WHERE address.district = 'Texas';



-- 2. Get all payments above $6.99 with the Customer's Full Name
-- ANSWER:
-- CODE:
SELECT customer.first_name, customer.last_name, payment.amount
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
-- ANSWER:
-- CODE:
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) >175
	ORDER BY SUM(amount) DESC
);


-- 4. List all customers that live in Nepal (use the city table)
-- ANSWER:
-- CODE:
SELECT per.first_name, per.last_name, country.country
FROM customer AS per
JOIN address
ON per.address_id = address.address_id

JOIN city
ON address.city_id = city.city_id

JOIN country
on city.country_id = country.country_id
WHERE country.country = 'Nepal';



-- 5. Which staff member had the most transactions?
-- ANSWER: Jon Stephens - 7304
-- CODE:
SELECT staff.first_name, staff.last_name, COUNT(payment_id) AS payCount 
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY payCount DESC;


-- 6. How many movies of each rating are there?
-- ANSWER:
-- CODE:
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
-- ANSWER:
-- CODE:
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	WHERE amount > 6.99
	GROUP BY customer_id
	HAVING COUNT(customer_id) = 1
);

-- 8. How many free rentals did our stores give away?
-- ANSWER: 24
-- CODE:
SELECT COUNT(amount)
FROM payment
WHERE amount = 0;


