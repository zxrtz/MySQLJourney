/*
 * Lesson 13: Creating Advanced Joins
 *
 */

 -- self join the same field
 SELECT cust_id,cust_name,cust_contact
 FROM Customers
 WHERE cust_name = (SELECT cust_name -- no need to use IN, theres only one company "cust_name"
					FROM Customers
					WHERE cust_contact = 'Jim Jones');

/*
 * Self Join common method
 */
SELECT c1.cust_id,c1.cust_name,c1.cust_contact
FROM Customers AS c1, Customers AS c2
WHERE c1.cust_name = c2.cust_name
AND c2.cust_contact = 'Jim Jones';

/*
 * Natural Joins WILDCARD
 * select specific columns
 * inner joins are usually natural joins
 */
SELECT C.*,O.order_num,O.order_date,
	OI.prod_id, OI.quantity,OI.item_price
FROM Customers as C, Orders AS O, OrderItems AS OI
WHERE C.cust_id = O.cust_id
AND OI.order_num = O.order_num
AND prod_id = 'RGAN01';


/*
 * LEFT/RIGHT OUTER JOIN
 * join columns even without common fields (including NULL values)
 */
-- this one includes all LEFT table values and writes NA if not found for the RIGHT
-- list of all customers including without orders: ( all customers including an order_num or NULL for the orders )
SELECT Customers.cust_id, Orders.order_num
FROM Customers
 LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;

-- all customers who have placed orders
SELECT Customers.cust_id, Orders.order_num
FROM Customers
 RIGHT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;

 /*
  * FULL OUTER JOIN
  * all rows from both tables, and relates those that can be related. includes unrelated rows from both tables
  */
SELECT Customers.cust_id, Orders.order_num
FROM Customers
FULL OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;


/*
 * Joining using Aggregate Functions
 * 
 */
 -- inner join
SELECT Customers.cust_id,
	COUNT(Orders.order_num) AS num_ord
FROM Customers
INNER JOIN Orders ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

-- left outer join (all NULL or 0 values from right)
SELECT Customers.cust_id,
       COUNT(Orders.order_num) AS num_ord
FROM Customers
 LEFT OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id
GROUP BY Customers.cust_id;

/*
Challenge 1:
Write a SQL statement using an INNER JOIN to retrieve customer name (cust_name in Customers) and all order numbers (order_num in Orders) for each.
*/
SELECT cust_name, order_num
FROM Customers
INNER JOIN Orders ON Orders.cust_id = Customers.cust_id;

/*
Challenge 2:
Modify the SQL statement you just created to list all customers, even those with no orders.
*/
SELECT cust_name, order_num
FROM Customers
LEFT OUTER JOIN Orders ON Orders.cust_id = Customers.cust_id;

/*
Challenge 3:
Use an OUTER JOIN to join the Products and OrderItems tables, returning a sorted list of product names (prod_name) and the order numbers (order_num) associated with each.
*/
SELECT prod_name,order_num
FROM Products
FULL OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id;

/*
Challenge 4:
Modify the SQL statement created in the previous challenge so that it returns a total of number of orders for each item (as opposed to the order numbers).
Aggregation most likely
*/
SELECT prod_name, SUM(quantity) as total_orders
FROM Products
FULL OUTER JOIN OrderItems ON Products.prod_id = OrderItems.prod_id
GROUP BY Products.prod_name;

/*
Challenge 5:
Write a SQL statement to list vendors (vend_id in Vendors) and the number of products they have available, including vendors with no products. 
You’ll want to use an OUTER JOIN and the COUNT() aggregate function to count the number of products for each in the Products table. 
Pay attention: the vend_id column appears in multiple tables, so any time you refer to it, you’ll need to fully qualify it.
*/
SELECT Vendors.vend_id, COUNT(prod_id) AS prod_total
FROM Vendors
FULL OUTER JOIN Products ON Products.vend_id = Vendors.vend_id
GROUP BY Vendors.vend_id;