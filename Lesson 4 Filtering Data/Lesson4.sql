/*
 * Lesson 4 - Filtering Data
 */


/*
 * WHERE Clause: get all product names and prices where prices = 3.49
 */
SELECT prod_name,prod_price
FROM Products
WHERE prod_price = 3.49;
-- **ORDER BY goes after WHERE Clause

-- using operators to filter
SELECT prod_name, prod_price
FROM Products
WHERE prod_price < 10;

-- other ops
SELECT prod_name,prod_price
FROM Products
WHERE vend_id != 'DLL01';
-- same effect as !=
SELECT prod_name,prod_price
FROM Products
WHERE vend_id <> 'DLL01';

/*
 *check for NULL value
 */
SELECT prod_name,prod_price
FROM Products
WHERE prod_price = NULL;
-- other way to check for null
SELECT cust_name
FROM Customers
WHERE cust_email IS NULL;


/*
 * BETWEEN operator: check for values within certain range
 */
SELECT prod_name,prod_price
FROM Products
WHERE prod_price BETWEEN 5 AND 10;


/*
 * CHALLENGE 1:
 * Write a SQL statement to retrieve the product ID (prod_id) and name (prod_name) from the Products table, returning only products with a price of 9.49
 */
 SELECT prod_id, prod_name
 FROM Products
 WHERE prod_price = 9.49;


 /*
 * CHALLENGE 2:
 * Write a SQL statement to retrieve the product ID (prod_id) and name (prod_name) from the Products table, returning only products with a price of 9 or more
 */
 SELECT prod_id,prod_name
 FROM Products
 WHERE prod_price > 9;


 /*
 * CHALLENGE 3:
 * retrieve the unique list of order numbers (order_num) from the OrderItems table, which contain 100 or more of any item
 */
 SELECT order_num
 FROM OrderItems
 WHERE order_num >= 100;


 /*
 * CHALLENGE 4:
 * return the product name (prod_name) and price (prod_price) from Products for all products priced between 3 and 6. Oh, and sort the results by price.
 */
 SELECT prod_name,prod_price
 FROM Products
 WHERE prod_price BETWEEN 3 AND 6
 ORDER BY prod_price;