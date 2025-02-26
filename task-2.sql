SELECT 
    f.title AS film_title, 
    f.length AS film_duration, 
    c.name AS category_name
FROM 
    film AS f
JOIN 
    film_category AS fc ON f.film_id = fc.film_id
JOIN 
    category AS c ON fc.category_id = c.category_id;
SELECT 
    f.title AS film_title, 
    r.rental_date
FROM 
    rental AS r
JOIN 
    inventory AS i ON r.inventory_id = i.inventory_id
JOIN 
    film AS f ON i.film_id = f.film_id
WHERE 
    r.customer_id = 1;
SELECT 
    f.title AS film_title, 
    COUNT(r.rental_id) AS rental_count
FROM 
    rental AS r
JOIN 
    inventory AS i ON r.inventory_id = i.inventory_id
JOIN 
    film AS f ON i.film_id = f.film_id
GROUP BY 
    f.title
ORDER BY 
    rental_count DESC
LIMIT 5;
INSERT INTO customer (first_name, last_name, address_id, store_id, active, create_date)
VALUES ('Alice', 'Cooper', 1, 1, 1, NOW());
UPDATE customer
SET address_id = (
    SELECT address_id 
    FROM address 
    WHERE address = '456 Elm St'
)
WHERE first_name = 'Alice' AND last_name = 'Cooper';
DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';

SELECT 
    c.name AS category_name, 
    COUNT(f.film_id) AS total_films
FROM 
    category AS c
JOIN 
    film_category AS fc ON c.category_id = fc.category_id
JOIN 
    film AS f ON fc.film_id = f.film_id
GROUP BY 
    c.name;
SELECT 
    c.name AS category_name, 
    AVG(f.length) AS average_length
FROM 
    category AS c
JOIN 
    film_category AS fc ON c.category_id = fc.category_id
JOIN 
    film AS f ON fc.film_id = f.film_id
GROUP BY 
    c.name;
SELECT 
    MIN(length) AS min_length, 
    MAX(length) AS max_length
FROM 
    film;
SELECT 
    COUNT(customer_id) AS total_customers
FROM 
    customer;
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    SUM(p.amount) AS total_payments
FROM 
    payment AS p
JOIN 
    customer AS c ON p.customer_id = c.customer_id
GROUP BY 
    c.customer_id;
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    SUM(p.amount) AS total_payments
FROM 
    payment AS p
JOIN 
    customer AS c ON p.customer_id = c.customer_id
GROUP BY 
    c.customer_id
ORDER BY 
    total_payments DESC
LIMIT 5;
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    COUNT(r.rental_id) AS total_rentals
FROM 
    rental AS r
JOIN 
    customer AS c ON r.customer_id = c.customer_id
GROUP BY 
    c.customer_id;
SELECT 
    AVG(EXTRACT(YEAR FROM AGE(release_year::date))) AS average_film_age
FROM 
    film;
SELECT 
    COUNT(r.rental_id) AS films_rented
FROM 
    rental AS r
WHERE 
    r.rental_date BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD';
SELECT 
    TO_CHAR(payment_date, 'YYYY-MM') AS payment_month, 
    SUM(amount) AS total_payments
FROM 
    payment
GROUP BY 
    TO_CHAR(payment_date, 'YYYY-MM')
ORDER BY 
    payment_month;
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    MAX(p.amount) AS max_payment
FROM 
    payment AS p
JOIN 
    customer AS c ON p.customer_id = c.customer_id
GROUP BY 
    c.customer_id;
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    AVG(p.amount) AS average_payment
FROM 
    payment AS p
JOIN 
    customer AS c ON p.customer_id = c.customer_id
GROUP BY 
    c.customer_id;
SELECT 
    rating, 
    COUNT(film_id) AS total_films
FROM 
    film
GROUP BY 
    rating;
SELECT 
    s.store_id, 
    AVG(p.amount) AS average_payment
FROM 
    payment AS p
JOIN 
    customer AS c ON p.customer_id = c.customer_id
JOIN 
    store AS s ON c.store_id = s.store_id
GROUP BY 
    s.store_id;

