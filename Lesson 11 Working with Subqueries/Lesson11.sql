/*
 * Lesson 11
 * Working with Subqueries:
 * Relational Databases
 */


 -- retrieve order id from orders
 SELECT order_num
 FROM OrderItems
 WHERE prod_id = 'RGAN01';
-- next, retrieve customer IDs associated with order numbers
SELECT cust_id
FROM Orders
WHERE order_num IN (20007, 20008);

-- combine the previous statements using a single query^^^
-- search query inside the WHERE clause, checking order_num equivalency
SELECT cust_id
FROM Orders
WHERE order_num IN (SELECT order_num 
						FROM OrderItems
						WHERE prod_id = 'RGAN01');

-- continue to bring up customer details after filtering those who ordered RGAN01
SELECT cust_name,cust_contact
FROM Customers
WHERE cust_id IN (1000000004,1000000005);

-- combine all searches and filters into one:
SELECT cust_name,cust_contact
FROM Customers
WHERE cust_id IN (SELECT cust_id
					FROM Orders
					WHERE order_num IN (SELECT order_num
											FROM OrderItems
											WHERE prod_id = 'RGAN01'));


-- subqueries as calculated fields: one customer
SELECT Count(*) AS orders -- total number of orders
FROM Orders
WHERE cust_id = 1000000001; -- total # of orders from this particular customer

-- subqueries as calculated fields: all customers COUNT()
SELECT cust_name,
		cust_state,
		(SELECT COUNT(*) -- basically count number of orders per cust_id, then use it to print cust_name and state
		 FROM Orders
		 WHERE Orders.cust_id = Customers.cust_id) AS orders
FROM Customers
ORDER BY cust_name;


/*
 * Challenge 1:
 * return a list of customers who bought items priced 10 or more. 
 * You’ll want to use the OrderItems table to find the matching order numbers (order_num) and then the Orders table to retrieve the customer ID (cust_id) for those matched orders
 */
 SELECT cust_id
 FROM Orders
 WHERE order_num IN (SELECT order_num 
					FROM OrderItems 
					WHERE item_price >= 10);

/*
 * Challenge 2:
 * Write a SQL statement that uses a subquery to determine which orders (in OrderItems) purchased items with a prod_id of BR01 
 * and then returns customer ID (cust_id) and order date (order_date) for each from the Orders table. 
 * Sort the results by order date.
 */
 SELECT cust_id,order_date
 FROM Orders
 WHERE order_num IN (SELECT order_num
						FROM Orderitems
						WHERE prod_id = 'BR01')
 ORDER BY order_date;


 /*
  * Challenge 3:
  * Update the previous challenge to return the customer email (cust_email in the Customers table) for any customers who purchased items with a prod_id of BR01. 
  * Hint: this involves the SELECT statement, the innermost one returning order_num from OrderItems, and the middle one returning cust_id from Customers
  */
  SELECT cust_email
  FROM Customers
  WHERE cust_id IN (SELECT cust_id
					FROM Orders
					WHERE order_num IN (SELECT order_num
										FROM Orderitems
										WHERE prod_id = 'BR01'));

/*
 * Challenge 4:
 * Write a SQL statement to return customer ID (cust_id in the Orders table) and total_ordered using a subquery to return the total of orders for each customer. 
 * Sort the results by amount spent from greatest to the least. 
 * Hint: you’ve used the SUM() to calculate order totals previously
 */
 SELECT cust_id,
		(SELECT SUM(quantity)
		FROM OrderItems
		WHERE OrderItems.order_num = Orders.order_num) AS total_ordered
 FROM Orders
 ORDER BY 2 DESC;


 /*
  * Challenge 5:
  * Write a SQL statement that retrieves all product names (prod_name) from the Products table, 
  * along with a calculated column named quant_sold containing the total number of this item sold (retrieved using a subquery and a SUM(quantity) on the OrderItems table).
  */
  SELECT prod_name,
		(SELECT SUM(quantity)
			FROM OrderItems
			WHERE Products.prod_id = OrderItems.prod_id) AS quant_sold
  FROM Products;