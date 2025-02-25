/*
 * Lesson 16. Updating and Deleting Data
 *
 */



/*
 * UPDATE: modify data in table
 */
  UPDATE Customers
  SET cust_email = 'kim@thetoystore.com'
  WHERE cust_id = 1000000005;

  -- update multiople columns
UPDATE Customers
SET cust_contact = 'Sam Roberts',
    cust_email = 'sam@toyland.com'
WHERE cust_id = 1000000006;

-- delete value (set to NULL)
UPDATE Customers
SET cust_email = NULL
WHERE cust_id = 1000000005;


/*
 * DELETE: delete all rows from table or specific ones
 */
 DELETE FROM Customers
 WHERE cust_id = 1000000006;

 /*
  * TRUNCATE TABLE: deletes all rows without data storage (faster)
  */


/*
Challenge 1:
USA state abbreviations should always be in uppercase. 
Write a SQL statement to update all USA addresses, both vendor states (vend_state in Vendors) and customer states (cust_state in Customers), 
so that they are uppercase.
*/
UPDATE Customers
SET cust_state = UPPER(cust_state)
WHERE LOWER(cust_country) = 'usa';

UPDATE Vendors
SET vend_state = UPPER(vend_state)
WHERE LOWER(vend_country) = 'usa';

/*
Challenge 2:
Lesson 15 Challenge 1 asked you to add yourself to the Customers table. 
Now delete yourself. Make sure to use a WHERE clause (and test it with a SELECT before using it in DELETE), or you’ll delete all customers!
*/
INSERT INTO Customers(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000009', 'The Toy Store', '4545 53rd Street', 'Fairfax', 'VA', '22015', 'USA', 'Dylan Nguyen', 'dylannguyen');

DELETE FROM Customers
WHERE cust_id = 1000000009;