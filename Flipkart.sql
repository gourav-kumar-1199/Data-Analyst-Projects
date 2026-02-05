create database flipkart;
use flipkart;
 
 select * from users;
 select * from orders;
 select * from order_details;
 select * from category;
 
 -- Assignment
 
 -- Q. Find order_id, name, city 
 select order_id,name, city from users inner join orders on users.user_id = orders.user_id; 
 
 -- Find the order_id and the product_category.
 SELECT 
    order_id, category
FROM
    order_details
        JOIN
    category ON order_details.category_id = category.category_id;
 
 -- Find all orders placed in pune.
 
 SELECT 
    COUNT(order_id) AS orders_placed_in_Pune
FROM
    orders
        JOIN
    users ON users.user_id = orders.user_id
WHERE
    city LIKE 'Pune';
 
 -- Find all orders under chair category.
 SELECT 
    order_id, category
FROM
    order_details o
        JOIN
    category c ON o.category_id = c.category_id
WHERE
    category = 'chairs';
    
    -- Find top 5 profitable products
    SELECT 
    Category, SUM(profit) AS revenue
FROM
    order_details o
        LEFT OUTER JOIN
    category c ON o.category_id = c.category_id
GROUP BY category
ORDER BY SUM(profit) DESC
LIMIT 5; 
    
    
-- Find the top 5 profitable orders.
SELECT 
    od.order_id, SUM(profit)
FROM
    orders o
        LEFT JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY order_id
ORDER BY SUM(profit) DESC
LIMIT 5;

-- Find the customer who had placed most number of orders.

SELECT 
    u.user_id, name, COUNT(order_id)
FROM
    orders o
        JOIN
    users u ON o.user_id = u.user_id
GROUP BY user_id , name
ORDER BY COUNT(order_id) DESC
LIMIT 1;

-- Find all categories profit higher than 3000.

SELECT 
    od.category_id, category, SUM(profit) AS profit_over_3000
FROM
    order_details od
        JOIN
    category c ON od.category_id = c.category_id
GROUP BY category , category_id
HAVING SUM(profit) > 3000;

-- Which is the most profitable state.
SELECT 
    state, SUM(profit) AS total_profit
FROM
    (SELECT 
        o.order_id, u.user_id, state
    FROM
        users u
    LEFT JOIN orders o ON u.user_id = o.user_id) i
        JOIN
    order_details od ON i.order_id = od.order_id
GROUP BY state
ORDER BY SUM(profit) DESC;

