/*
 * Lesson 9:
 * Summarizing Data
 */

 
/*
 * Aggregate Functions:
 *
 * AVG() average column's value
 * COUNT() number of rows
 * MAX() max value
 * MIN() min value
 * SUM() sum of column's values
 */

-- AVG() function
SELECT AVG(prod_price) AS avg_price
FROM Products;

 -- AVG() specific vendor
SELECT AVG(prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';

-- COUNT() number of rows
SELECT COUNT(*) AS num_cust
FROM Customers;
-- NULL values are ignored

-- MAX() price
SELECT MAX(prod_price) AS max_price
FROM Products;

-- MIN() price
SELECT MIN(prod_price) AS min_price
FROM Products;

-- SUM() price with order_num filter
SELECT SUM(quantity) AS items_ordered
FROM OrderItems
WHERE order_num = 20005;

-- SUM() using calculated field
SELECT SUM(item_price*quantity) AS total_price
FROM OrderItems
WHERE order_num = 20005;
-- NULL values ignored

-- AVG() of unique item prices
SELECT AVG(DISTINCT prod_price) AS avg_price
FROM Products
WHERE vend_id = 'DLL01';

-- all of it put together
SELECT COUNT(*) AS num_items,
	MIN(prod_price) AS price_min,
	MAX(prod_price) AS price_max,
	AVG(prod_price) AS price_avg
FROM Products;


/*
 * Challenge 1:
 * Write a SQL statement to determine the total number of items sold (using the quantity column in OrderItems)
 */
 SELECT SUM(quantity) AS total_sold
 FROM OrderItems;

 /*
  * Challenge 2:
  * Modify the statement you just created to determine the total number of product item (prod_item) BR01 sold.
  */
SELECT SUM(quantity) AS total_BR01_sold
FROM OrderItems
WHERE prod_id = 'BR01';

 /*
  * Challenge 3:
  * Write a SQL statement to determine the price (prod_price) of the most expensive item in the Products table that costs no more than 10. Name the calculated field max_price.
  */
SELECT MAX(prod_price) as max_price
FROM Products
WHERE prod_price <= 10;