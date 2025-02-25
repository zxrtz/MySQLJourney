/*
 * Lesson 14: Combining Queries
 */


 -- individual where statements (using or operator)
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL','IN','MI')
OR cust_name = 'Fun4All';


/*
 * UNION Operator: combine SQL queries!
 * dupe rows eleminated
 */
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL','IN','MI')
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';


/*
 * UNION ALL:
 * does not eliminate duplicates
 */
 -- jjones@fun4all.com duplicate
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL','IN','MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All';

/*
 * ORDER BY with UNION:
 * will sort ALL occurrences if ORDER BY is put at the end
 */
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state IN ('IL','IN','MI')
UNION ALL
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_name = 'Fun4All'
ORDER BY cust_name, cust_contact;

/*
EXCEPT (also called MINUS) retrieve A U Bc
INTERSECT
*/

/* 
Challenge 1
Write a SQL statement that combines two SELECT statements that retrieve product ID (prod_id) and quantity from the OrderItems table, 
one filtering for rows with a quantity of exactly 100, 
and the other filtering for products with an ID that begins with BNBG. Sort the results by product ID.
*/
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100
UNION
SELECT prod_id, quantity
FROM OrderItems
WHERE prod_id = 'BNBG%'
ORDER BY prod_id;

/*
Challenge 2
Rewrite the SQL statement you just created to use a single SELECT statement
*/
-- self join
SELECT prod_id, quantity
FROM OrderItems
WHERE quantity = 100 OR prod_id = 'BNBG%'
ORDER BY prod_id;

/*
Challenge 3
This one is a little nonsensical, I know, but it does reinforce a note earlier in this lesson. 
Write a SQL statement which returns and combines product name (prod_name) from Products and customer name (cust_name) from Customers, and sort the result by product name.
*/
SELECT p.prod_name, c.cust_name
FROM Products p
JOIN OrderItems oi ON oi.prod_id = p.prod_id
JOIN Orders o ON o.order_num = oi.order_num
JOIN Customers c ON c.cust_id = o.cust_id
ORDER BY p.prod_name;

-- Challenge 4:
-- What is wrong with the following SQL statement? (Try to figure it out without running it.)
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state  = 'MI' -- there's two ORDER BY and semicolons: one is on this line and i removed it
UNION
SELECT cust_name, cust_contact, cust_email
FROM Customers
WHERE cust_state = 'IL'ORDER BY cust_name;