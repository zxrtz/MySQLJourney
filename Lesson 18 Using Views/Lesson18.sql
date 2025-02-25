/*
 * Lesson 18: Using Views
 
 CREATE VIEW viewname AS
 DROP VIEW viewname

 */

/* 
VIEWS:
views can be used to reuse SQL statements
views can be also used to simplify complex SQL ops
views can expose parts of table instead of whole thing
views can be used to secure data
views can change data formatting and representations
*/



-- create view that joins Customers, Orders, and OrderItems
 CREATE VIEW ProductCustomers AS
 SELECT cust_name,cust_contact,prod_id
 FROM Customers, Orders, OrderItems
 WHERE Customers.cust_id = Orders.cust_id
 AND OrderItems.order_num = Orders.order_num;
 -- check the view
 SELECT * FROM ProductCustomers;


-- filter the view by product
SELECT cust_name, cust_contact
FROM ProductCustomers
WHERE prod_id = 'RGAN01';


-- concatenated fields in views
CREATE VIEW VendorLocations AS
SELECT RTRIM(vend_name) + ' (' + RTRIM(vend_country) + ')' AS vend_title
FROM Vendors;
-- check the view
SELECT * FROM VendorLocations;


-- filter out customers without emails
CREATE VIEW CustomersEmailList AS
SELECT cust_id,cust_name,cust_email
FROM Customers
WHERE cust_email IS NOT NULL;
--check the view
SELECT * FROM CustomersEmailList;


-- simplify use of calculated fields
CREATE VIEW OrderItemsExpanded AS
SELECT order_num,
		prod_id,
		quantity,
		item_price,
		quantity*item_price AS expanded_price
FROM OrderItems;
-- check the view
SELECT expanded_price FROM OrderItemsExpanded;


/*
Challenge 1:
Create a view called CustomersWithOrders that contains all of the columns in Customers but includes only those who have placed orders. 
Hint: you can use JOIN on the Orders table to filter just the customers you want. 
Then use a SELECT to make sure you have the right data.
*/
CREATE VIEW CustomersWithOrders AS
SELECT Customers.*
FROM Customers
JOIN Orders ON Customers.cust_id = Orders.cust_id
WHERE Orders.order_num IS NOT NULL;
-- check view
SELECT * FROM CustomersWithOrders;

/*
Challenge 2:
What is wrong with the following SQL statement? (Try to figure it out without running it.)
*/
-- ANSWER: you can't use ORDER BY on a view.
CREATE VIEW OrderItemsExpanded AS
SELECT order_num,
       prod_id,
       quantity,
       item_price,
       quantity*item_price AS expanded_price
FROM OrderItems
ORDER BY order_num;
