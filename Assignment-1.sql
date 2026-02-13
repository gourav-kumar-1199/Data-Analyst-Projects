create database assignment;
use assignment;
create table product(
ProductID INT PRIMARY KEY,
ProductName
VARCHAR(50), Category
VARCHAR(30), Price
DECIMAL(10,2),
Stock INT,
Supplier VARCHAR(30));

INSERT INTO product (ProductID, ProductName, Category, Price, Stock, Supplier)
VALUES(201, 'Laptop', 'Electronics', 55000, 25, 'HP'),
(202, 'Smartphone', 'Electronics', 25000, 100, 'Samsung'),
(203, 'Tablet', 'Electronics', 30000, 50, 'Apple'),
(204, 'Headphones', 'Accessories', 2000, 200, 'Sony'),
(205, 'Keyboard', 'Accessories', 1500, 150, 'Logitech'),
(206, 'Refrigerator', 'Appliances', 40000, 30, 'LG'),
(207, 'Washing Machine', 'Appliances', 35000, 20, 'Whirlpool'),
(208, 'Microwave', 'Appliances', 12000, 40, 'IFB'),
(209, 'Chair', 'Furniture', 5000, 80, 'IKEA'),
(210, 'Sofa', 'Furniture', 25000, 10, 'Godrej'),
(211, 'Monitor', 'Electronics', 18000, 60, 'Dell'),
(212, 'Mouse', 'Accessories', 800, 300, 'Logitech'),
(213, 'Printer', 'Electronics', 15000, 35, 'Canon'),
(214, 'Air Conditioner', 'Appliances', 45000, 15, 'Voltas'),
(215, 'Water Purifier', 'Appliances', 12000, 25, 'Kent'),
(216, 'Dining Table', 'Furniture', 30000, 5, 'IKEA'),
(217, 'Bookshelf', 'Furniture', 12000, 12, 'Godrej'),
(218, 'Power Bank', 'Electronics', 2000, 180, 'Mi'),
(219, 'Camera', 'Electronics', 40000, 22, 'Nikon'),
(220, 'Smartwatch', 'Electronics', 12000, 90, 'Apple'),
(221, 'Blender', 'Appliances', 5000, 45, 'Philips'),
(222, 'Toaster', 'Appliances', 2500, 55, 'Bajaj'),
(223, 'Bed', 'Furniture', 45000, 8, 'Durian'),
(224, 'Wardrobe', 'Furniture', 60000, 6, 'Godrej'),
(225, 'Earbuds', 'Accessories', 3500, 250, 'Boat'),
(226, 'Speakers', 'Accessories', 7000, 120, 'JBL'),
(227, 'Router', 'Electronics', 4000, 140, 'TP-Link'),
(228, 'Vacuum Cleaner', 'Appliances', 15000, 28, 'Eureka'),
(229, 'Mixer Grinder', 'Appliances', 7000, 50, 'Prestige'),
(230, 'Study Table', 'Furniture', 15000, 18, 'IKEA');

select * from product;
-- ************ PART-A WHERE CLAUSE***********
-- 1. Display all products in the Electronics category.
select ProductName,Category from product where Category like "Electronics";

-- 2.Find products whose price is greater than 30,000.
select ProductName from product where Price >30000;

-- 3. Show products whose stock is less than 50.
select ProductName, Stock from product where Stock < 50;

-- 4. Display all products not in the Accessories category.
select ProductName, Category from product where Category != "Accessories";

-- 5. Find products supplied by LG or Whirlpool.
select ProductName, Supplier from product Where Supplier like "Whirlpool" or "LG"; 

-- 6. Show products whose price is between 10,000 and 40,000.
select ProductName, Price from product where price between 10000 and 40000;

-- 7. List products where stock is exactly 100.
select ProductName, Stock from product where Stock = 100;

-- 8. Find all products except those in the Furniture category.
 select ProductName, Category from product where Category != "Furniture";
 
 -- 9. Display products with price less than 5,000.
 select ProductName from product where Price <5000;
 
 -- 10. Show all products supplied by Sony.
 select ProductName as Product_by_Sony from product where Supplier like "Sony";
 
 -- ************** ORDER-BY***********
 
 -- 1. Display all products sorted by Price in ascending order.
select ProductName, Price from product order by Price;
 
 -- 2. Show all products sorted by Price in descending order.
 select ProductName, Price from product order by Price desc;
 
 -- 3. Display all products sorted by Stock in ascending order.
 select ProductName, Stock from product order by Stock;
 
 -- 4. List all products sorted by Category alphabetically.
 select ProductName, Category from product order by Category asc;
 
 -- 5. Display all products sorted by Supplier alphabetically.
 select ProductName, Supplier from product order by Supplier asc;
 
 -- 6. Show products in the Appliances category sorted by Price (highest first).
 select ProductName, Price, Category from product where Category like "Appliances" order by Price desc;
 
 -- 7. Display all products sorted by Category and then by Price.
 select ProductName, Category, Price from product order by Category, Price;
 
 -- 8. List Electronics products sorted by Stock in descending order.
 select Category, ProductName, Stock from product where Category like "Electronics" order by Stock desc;
 
 -- 9. Display products sorted by ProductName (A Z).
select ProductName from product order by ProductName;

-- 10. Show Furniture products sorted by Price (lowest first).
select Category,ProductName, Price from product where Category like "Furniture" order by Price; 


-- *****************AGGREGATE FUNCTION****************

-- 1. Find the total stock of all products.
select ProductName, sum(Stock) as Total_Stock from product group by ProductName;

-- 2. Find the average price of all products.
select ProductName, avg(Price) from product group by ProductName; 

-- 3. Show the maximum price among all products.
select ProductName, max(Price) as Max_Price from product group by ProductName;


-- 4. Show the minimum stock among all products.
select ProductName, min(Stock) as Min_Stock from product group by ProductName;

-- 5. Find the average price of Electronics products.
select Category, avg(Price) from product group by Category having Category like "Electronics";


-- 6. Count the number of products in the Furniture category.
select count(ProductName), Category from product group by Category having Category = "Furniture";


-- 7. Show the highest-priced product in the Appliances category.
select ProductName, Price from product where Category = "Appliances"  order by Price desc;

-- 8. Display the lowest price in Accessories category.
select Category, min(Price) from product Group by  Category having Category = "Accessories"; -- order by Price ;

-- 9. Find the sum of stock for Electronics products.
select Category, sum(Stock) from product Group by Category having Category = "Electronics";

-- 10. Count the number of products whose price is above 20,000.
select count(ProductName), Price from product where Price > 20000;


-- *************LIKE-OPERATORS*********

-- 1. Find products whose names start with ‘S’.
select ProductName from product where ProductName like 'S%';
select ProductName from product where substring(ProductName,1,1) like 'S';

-- 2. Find products whose names start with ‘M’.
select ProductName from product where ProductName like 'M%';

-- 3. Find products whose names end with ‘e’.
select ProductName from product where ProductName like '%e';

-- 4. Find products whose names contain ‘phone’.
select ProductName from product where ProductName like '%phone%'; 

-- 5. Show products where Supplier name starts with ‘L’.
select ProductName, Supplier from product where Supplier like 'L%';

-- 6. Show products where Supplier name ends with ‘a’.
select ProductName, Supplier from product where Supplier like '%A';

-- 7. Display products where Category starts with ‘E’.
select ProductName, Category from product where Category like 'E%';

-- 8. Show products where Category ends with ‘s’.
select productName, Category from product where Category like '%s';


-- 9. Show products where Category name has 10 characters (use _).
select ProductName,Category from product where Category like '%________%';
select ProductName,Category from product where length(Category) = 10;

-- 10. Display products whose ProductName has exactly 6 letters.
select ProductName from product where length(ProductName) =6;
select * from product;