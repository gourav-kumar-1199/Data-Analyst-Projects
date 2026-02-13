use assignment;
select * from product;

-- PART A : GROUP BY CLAUSE

-- 1 Display the total stock available for each category.
SELECT category, sum(stock) as total_stock from product group by category order by total_stock desc;

-- 2 Find the average price of products for each category.

select category, avg(price) as avg_price from product group by category order by avg_price desc;

-- 3 Show the maximum price of products in each supplier group.

select Supplier, Productname, max(Price) as Prod_max_Price from product group by Supplier, Productname order by max(Price) desc;

-- 4 Display the minimum stock available from each supplier.
select supplier, min(stock) as minimum_stock from product group by supplier order by minimum_stock desc;

-- 5 Count the number of products in each category.
select category, count(ProductName) from product group by category;

-- 6 Show the sum of stock supplied by each supplier.
select supplier, sum(stock) as total_stock from product group by supplier order by total_stock desc;

-- 7 Display the highest-priced product in each category.
select category, productname, max(price) as highest_price_product from product group by category, productname order by highest_price_product;

select productname, max(price) as highest_price_product from product group by productname order by highest_price_product;

-- 8 Find the average stock of products grouped by category.

select category, productname, avg(stock) as average_stock from product group by category, productname order by average_stock desc;

-- 9 Count how many products are there for each supplier.
select supplier,count(productname) as number_of_products from product group by supplier order by count(productname) desc;

-- 10 Show the total price (sum) of products for each category.
select category, productname, sum(price*stock) as total_price_product from product group by category, productname order by total_price_product desc;


-- ***************************** HAVING CLAUSE********************

use product;

-- 1 Display categories having more than 3 products.
select category,count(productname) from product group by category having count(productname)>3;

-- 2 Show suppliers where the average product price is greater than 20,000.
select supplier, avg(price) as avg_price from product group by supplier having avg_price>20000;

-- 3 Find categories whose total stock is more than 200.
select category, sum(stock) as total_stock from product group by category having total_stock>200;

-- 4 Display suppliers supplying more than 2 products.
select supplier, count(productname) from product group by supplier having count(productname)>2;

-- 5 Show categories where the highest product price exceeds 40,000.
select category, productname, max(price) from product group by category, productname having max(price)>40000;

-- 6 Find suppliers where the total stock is less than 100.
select supplier, sum(stock) from product group by supplier having sum(stock)<100;

-- 7 Display categories having an average stock greater than 50.


-- 8 Show suppliers who supply at least one product priced above 30,000.
select supplier,productname, price from product having price>30000;

-- 9 Find categories where the total value (sum of price) exceeds 1,00,000.
select category, sum(price) from product group by category having sum(price)>100000;

-- 10 Display suppliers where the number of products supplied is exactly 3.
select supplier, count(productname) from product group by supplier having count(productname) = 3;