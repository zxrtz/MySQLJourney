/*
 * Lesson 5 - Advanced Data Filtering
 */

 /*
  * Adding operators to filter to increase precision
  * AND, OR
  */
 -- AND operator with WHERE Clause, filtering
 SELECT prod_id,prod_price,prod_name
 FROM Products
 WHERE vend_id = 'DLL01' AND prod_price <= 4;

 -- OR operator, with ordered clause
  SELECT prod_id,prod_price,prod_name
 FROM Products
 WHERE vend_id = 'DLL01' OR prod_price <= 4
 ORDER BY prod_price;

  -- multiple operators
 SELECT prod_id,prod_price,prod_name
 FROM Products
 WHERE vend_id = 'DLL01' AND prod_price <= 4 OR prod_price > 10;

 -- PEMDAS higher order evaluation of operators
 SELECT prod_name,prod_price
 FROM Products
 WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01');


/*
 * IN Operator: select range of conditions
 * Using OR operator yields same result
 * IN operator is shorter
 */
 SELECT prod_name,prod_price
 FROM Products
 WHERE vend_id IN ('DLL01','BRS01')
 ORDER BY prod_name;

 /*
  * NOT Operator: filter without this condition
  * not really an advantage unless using complex clauses/conditions
  */
  SELECT prod_name
  FROM Products
  WHERE NOT vend_id = 'DLL01';
  -- equivalent code
  SELECT prod_name
  FROM Products
  WHERE vend_id != 'DLL01';


/*
 * CHALLENGE 1:
 * retrieve the vendor name (vend_name) from the Vendors table, returning only vendors in California (this requires filtering by both country [USA] and state [CA]
 */
 SELECT vend_name, vend_state, vend_country
 FROM Vendors
 WHERE vend_state = 'CA' AND vend_country = 'USA';

 /*
 * CHALLENGE 2:
 * find all orders where at least 100 of items BR01, BR02, or BR03 were ordered. 
 * You’ll want to return order number (order_num), product ID (prod_id), and quantity for the OrderItems table, filtering by both the product ID and quantity.
 */
 SELECT order_num,prod_id,quantity
 FROM OrderItems
 WHERE prod_id IN ('BR01','BR02','BR03') AND quantity >= 100;


 /*
 * CHALLENGE 3:
 * return the product name (prod_name) and price (prod_price) from Products for all products priced between 3 and 6
 * sort by price
 */
 SELECT prod_name, prod_price
 FROM Products
 WHERE prod_price BETWEEN 3 and 6
 ORDER BY prod_price;

 /*
 * CHALLENGE 4:
 * What is wrong with the following SQL statement?
	SELECT vend_name
	FROM Vendors
	ORDER BY vend_name
	WHERE vend_country = 'USA' AND vend_state = 'CA';
 *
 * Answer: ORDER BY is supposed to be after WHERE Clause.
 */