/*
 * Lesson 10:
 * Grouping Data
 */

 /*
  * GROUP BY clause: divide data into logical sets to perform calculation
  */
-- group data by vend_id and count by group
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id;
-- NULL is also returned as a group.

/*
 * HAVING operator: used to filter groups with GROUP BY, usually with aggregation
 */
 -- count only customers with 2 or more orders
 SELECT cust_id, COUNT(*) AS orders
 FROM Orders
 GROUP BY cust_id
 HAVING COUNT(*)>=2;

 -- WHERE, GROUP BY, HAVING
 -- price >= 4, count of products per vend_id group >= 2
 SELECT vend_id, COUNT(*) AS num_prods
 FROM Products
 WHERE prod_price >= 4
 GROUP BY vend_id
 HAVING COUNT(*) >= 2;
-- alternate one without WHERE, lists all prices
SELECT vend_id, COUNT(*) AS num_prods
FROM Products
GROUP BY vend_id
HAVING COUNT(*) >= 2;

SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;

/* SELECT statement clause order hierarchy:
 *
 * SELECT
 * FROM
 * WHERE
 * GROUP BY
 * HAVING
 * ORDER BY 
 */

 
/*
 * Challenge 1:
 * OrderItems: Write a SQL statement that returns the number of lines (as order_lines) for each order number (order_num) and sort the results by order_lines.
 */
SELECT COUNT(order_num) AS order_lines
FROM OrderItems
GROUP BY order_num;

/*
 * Challenge 2:
 * Write a SQL statement that returns a field named cheapest_item, 
 * which contains the lowest-cost item for each vendor (using prod_price in the Products table), 
 * and sort the results from lowest to highest cost.
 */
SELECT MIN(prod_price) AS cheapest_item
FROM Products
GROUP BY prod_price
ORDER BY prod_price;

/*
 * Challenge 3:
 * It’s important to identify the best customers, so write a SQL statement to return the order number (order_num in the OrderItems table) for all orders of at least 100 items.
 */
 SELECT order_num
 FROM OrderItems
 WHERE quantity >= 100;

 /*
  * Challenge 4:
  * Another way to determine the best customers is by how much they have spent. 
  * Write a SQL statement to return the order number (order_num in the OrderItems table) for all orders with a total price of at least 1000. 
  */
  SELECT order_num
  FROM OrderItems
  WHERE quantity*item_price >= 1000
  ORDER BY order_num;

/*
 * Challenge 5: whats wrong with the code?
 * SELECT order_num, COUNT(*) AS items
 * FROM OrderItems
 * GROUP BY items
 * HAVING COUNT(*) >= 3
 * ORDER BY items, order_num;
 */

 -- answer: can't use GROUP BY on a count, and all fields retrieved in SELECT must also be in GROUP BY.
 
 -- correct code for challenge 5:
SELECT order_num, COUNT(*) AS items
FROM OrderItems
GROUP BY order_num
HAVING COUNT(*) >= 3
ORDER BY items, order_num;