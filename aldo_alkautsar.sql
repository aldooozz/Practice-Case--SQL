/*1. A customer wants to know the films about “astronauts”. How many recommendations could you give for him? */
SELECT COUNT (DISTINCT description)
FROM	film WHERE 	description LIKE '%tro%'

/*2 how many films have a rating of “R” and a replacement cost between $5 and $15? */
SELECT Count (DISTINCT film) from film
WHERE rating = 'R'AND replacement_cost >=5 and replacement_cost <=15

/*3 How many payments did each staff member handle? And how much was the total amount processed by each staff member? */
SELECT staff_id, COUNT (payment_id) FROM payment GROUP BY staff_id

/*4 the average replacement cost of movies by rating!*/
SELECT rating, AVG (replacement_cost) FROM film GROUP by rating

/* 5 Get the customer name, email and their spent amount!*/

SELECT  customer.first_name , customer.last_name, customer.email , customer.customer_id, SUM (payment.amount)
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id 
GROUP BY customer.customer_id 
ORDER BY SUM (payment.amount) DESC
LIMIT 5

/* 6 How many copies of each movie in each store, do we have?*/

SELECT film_id, COUNT (inventory_id) FROM inventory GROUP BY film_id ORDER BY film_id

/* 7 the customer has at least a total of 40 transaction payments. Get the customer name, email who are eligible for the credit card! */

SELECT customer_id, COUNT (payment_id) FROM payment GROUP BY customer_id 
HAVING COUNT (payment_id) > 40