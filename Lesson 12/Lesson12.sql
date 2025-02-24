/*
 * Lesson 12
 * Joining Tables
 * (Relational Database Joining)
 */

 /*
  * JOIN field ON:
  */
  SELECT vend_name,prod_name, prod_price
  FROM Vendors
  JOIN Products ON Vendors.vend_id = Products.vend_id;
  -- same thing with "inner". literally teh same.
  SELECT vend_name,prod_name,prod_price
  FROM Vendors
  INNER JOIN Products ON Vendors.vend_id = Products.vend_id;


 /*
  * equijoin - Joining Tables using multiple FROM arguments
  */
  -- Vendors and Products using vend_id as a primary key
  SELECT vend_name, prod_name, prod_price
  FROM Vendors, Products
  WHERE Vendors.vend_id = Products.vend_id;


/*
 * Joining Multiple Tables
 */
-- multiple FROM arguments, filters for every master key
SELECT prod_name,vend_name,prod_price,quantity
FROM OrderItems, Products, Vendors
WHERE Products.vend_id = Vendors.vend_id
AND OrderItems.prod_id = Products.prod_id
AND order_num = 20007;

-- instead of using multiple subqueries, join for runtime efficiency
SELECT cust_name, cust_contact
FROM Customers, Orders, OrderItems
WHERE Customers.cust_id = Orders.cust_id
AND OrderItems.order_num = Orders.order_num
AND prod_id = 'RGAN01';


/*
 * Challenge 1:
 * return customer name (cust_name) from the Customers table and related order numbers (order_num) from the Orders table, 
 * sorting the result by customer name and then by order number. 
 * Actually, try this one twice—once using simple equijoin syntax and once using an INNER JOIN
 */
 -- equijoin
SELECT cust_name, order_num
FROM Customers, Orders
WHERE Customers.cust_id = Orders.cust_id;

-- INNER JOIN
SELECT cust_name, order_num
FROM Customers
JOIN Orders ON Customers.cust_id = Orders.cust_id;


 /*
 * Challenge 2:
 * Let’s make the previous challenge more useful. 
 * In addition to returning the customer name and order number, add a third column named OrderTotal containing the total price of each order. 
 * There are two ways to do this: you can create the OrderTotal column using a subquery on the OrderItems table, or you can join the OrderItems table to the existing tables and use an aggregate function. 
 * Here’s a hint: watch out for where you need to use fully qualified column names.
 */
SELECT Customers.cust_name, Orders.order_num, SUM(OrderItems.quantity*Products.prod_price) AS OrderTotal
FROM Customers
JOIN Orders ON Customers.cust_id = Orders.cust_id -- link Orders to Customers
JOIN OrderItems ON Orders.order_num = OrderItems.order_num -- link OrderItems to Orders
JOIN Products ON Products.prod_id = OrderItems.prod_id -- linked Products to OrderItems
GROUP BY Customers.cust_name, Orders.order_num;


 /*
 * Challenge 3:
 * Let’s revisit Challenge 2 from Lesson 11. 
 * Write a SQL statement that retrieves the dates when product BR01 was ordered, but this time use a join and simple equijoin syntax. 
 * The output should be identical to the one from Lesson 11.
 */
 -- JOIN for better reading
 SELECT order_date, Customers.cust_id, OrderItems.prod_id
 FROM Orders
 JOIN Customers ON Orders.cust_id = Customers.cust_id
 JOIN OrderItems ON OrderItems.order_num = Orders.order_num
 WHERE OrderItems.prod_id = 'BR01';



 /*
 * Challenge 4:
 * Re-create the SQL you wrote for Lesson 11 Challenge 3, but this time using ANSI INNER JOIN syntax. 
 * The code you wrote there employed two nested subqueries. 
 * To re-create it, you’ll need two INNER JOIN statements, each formatted like the INNER JOIN example earlier in this lesson. And don’t forget the WHERE clause to filter by prod_id
 */
 SELECT cust_email
 FROM Orders
 JOIN Customers ON Orders.cust_id = Customers.cust_id
 JOIN OrderItems ON OrderItems.order_num = Orders.order_num
 WHERE OrderItems.prod_id = 'BR01';



 /*
 * Challenge 5:
 One more, and to make things more fun, we’ll mix joins, aggregate functions, and grouping too. 
 Ready? Back in Lesson 10 I issued you a challenge to find all order numbers with a value of 1000 or more. 
 Those results are useful, but what would be even more useful is the names of the customers who placed orders of at least that amount. 
 So, write a SQL statement that uses joins to return customer name (cust_name) from the Customers table and the total price of all orders from the OrderItems table. 
 Here’s a hint: to join those tables, you’ll also need to include the Orders table 
 (because Customers is not related directly to OrderItems, Customers is related to Orders, and Orders is related to OrderItems). 
 Don’t forget GROUP BY and HAVING, and sort the results by customer name. You can use simple equijoin or ANSI INNER JOIN syntax for this one. 
 Or, if you are feeling brave, try writing it both ways
 */
  SELECT cust_name, SUM(OrderItems.quantity*OrderItems.item_price) AS total_price, Orders.order_num
  FROM Customers
  JOIN Orders ON Orders.cust_id = Customers.cust_id
  JOIN OrderItems ON OrderItems.order_num = Orders.order_num
  GROUP BY Customers.cust_name, Orders.order_num
  HAVING SUM(OrderItems.quantity*OrderItems.item_price) >= 1000
  ORDER BY Orders.order_num;

