/*
 * Lesson 3: Sorting Data
 */

-- order by certain column
SELECT prod_name
FROM Products
ORDER BY prod_name;

-- retrieve three columns and sorts the results price, then name
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price, prod_name;
-- identical way to do the previous code (order by 2nd then 3rd columns in SELECT list)
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY 2, 3;

-- order by descending order instead of default ascending
SELECT prod_id, prod_price
FROM Products
ORDER BY prod_price DESC;

/* 
 * descending price BUT ascending name
 * The DESC keyword only applies to the column name that directly precedes it
 * each column must have DESC for it to descend
 */
SELECT prod_id, prod_price, prod_name
FROM Products
ORDER BY prod_price DESC, prod_name;


/*
 * CHALLENGE 1: 
 * Write a SQL statement to retrieve all customer names (cust_names) from the Customers table, 
 * and display the results sorted from Z to A
 */
 SELECT cust_name
 FROM Customers 
 ORDER BY 1 DESC;

 /*
 * CHALLENGE 2: 
 * Write a SQL statement to retrieve customer ID (cust_id) and order number (order_num) from the Orders table, 
 * and sort the results first by customer ID and then by order date in reverse chronological order
 */
 SELECT cust_id, order_num
 FROM Orders
 ORDER BY cust_id, order_date DESC;


 /*
 * CHALLENGE 3: 
 * Our fictitious store obviously prefers to sell more expensive items, and lots of them. 
 * Write a SQL statement to display the quantity and price (item_price) from the OrderItems table,
 * sorted with the highest quantity and highest price first
 */
 SELECT quantity, item_price 
 FROM OrderItems
 ORDER BY quantity DESC, item_price DESC;


 /*
 * CHALLENGE 4: What is wrong with the following code?
 * SELECT vend_name,
 * FROM Vendors
 * ORDER vend_name DESC;
 */
 -- The ORDER Clause must be followed with BY in order to descend sequentially through column vend_name.
