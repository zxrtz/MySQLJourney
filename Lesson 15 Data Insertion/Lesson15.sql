/*
 * Lesson 15:
 * Inserting Data
 */
 
/*
 * INSERT add rows to database table
 * insertion using a "tuple" from python
 */
 -- unsafe way
INSERT Customers
VALUES(1000000006,
       'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111',
       'USA',
       NULL,
       NULL);

-- SAFER WAY using *fields* and then the values themselves
INSERT Customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country,
                      cust_contact,
                      cust_email)
VALUES(1000000006,
       'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111',
       'USA',
       NULL,
       NULL);

-- different order with qualified fields
INSERT Customers(cust_id,
                      cust_contact,
                      cust_email,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip)
VALUES(1000000006,
       NULL,
       NULL,
       'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111');


-- INSERT partial rows, missing contact and email
-- missing fields are input as NULL
INSERT Customers(cust_id,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country)
VALUES(1000000006,
       'Toy Land',
       '123 Any Street',
       'New York',
       'NY',
       '11111',
       'USA');

-- create and populate new list NewCust for Customers to be added to
-------------------------
-- Create Customers table
-------------------------
CREATE TABLE CustNew
(
  cust_id      char(10)  NOT NULL ,
  cust_name    char(50)  NOT NULL ,
  cust_address char(50)  NULL ,
  cust_city    char(50)  NULL ,
  cust_state   char(5)   NULL ,
  cust_zip     char(10)  NULL ,
  cust_country char(50)  NULL ,
  cust_contact char(50)  NULL ,
  cust_email   char(255) NULL 
);
---------------------------
-- Populate Customers table
---------------------------
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000006', 'Village Toys', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'John Smith', 'sales@villagetoys.com');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES('1000000007', 'Kids Place', '333 South Lake Drive', 'Columbus', 'OH', '43333', 'USA', 'Michelle Green');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000008', 'Fun4All', '1 Sunny Place', 'Muncie', 'IN', '42222', 'USA', 'Jim Jones', 'jjones@fun4all.com');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUES('1000000009', 'Fun4All', '829 Riverside Drive', 'Phoenix', 'AZ', '88888', 'USA', 'Denise L. Stephens', 'dstephens@fun4all.com');
INSERT INTO CustNew(cust_id, cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact)
VALUES('10000000010', 'The Toy Store', '4545 53rd Street', 'Chicago', 'IL', '54545', 'USA', 'Kim Howard');


/*
 * ADD TWO TABLES USING INSERT SELECT
 *		can have where filter in select statement as well
 *		INSERT usually only does 1 row unless using SELECT
 */
 INSERT Customers(cust_id,
                      cust_contact,
                      cust_email,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country)
SELECT cust_id,
       cust_contact,
       cust_email,
       cust_name,
       cust_address,
       cust_city,
       cust_state,
       cust_zip,
       cust_country
FROM CustNew;
-- error if its already been added


/*
 * CREATE SELECT (SELECT INTO in server)
 *		Copy from one Table to Another
 *		copies data into new table and overwrites if already exists
 *
 CREATE TABLE CustCopy AS SELECT * FROM Customers; -- syntax for most DBMSs
 */
-- microsoft server syntax
SELECT * INTO CustCopy FROM Customers;

-- can select individual columns instead of all columns to copy


/*
Challenge 1:
Using INSERT and columns specified, add yourself to the Customers table. Explicitly list the columns you are adding and only the ones you need.
*/
INSERT Customers(cust_id,
                      cust_contact,
                      cust_email,
                      cust_name,
                      cust_address,
                      cust_city,
                      cust_state,
                      cust_zip,
                      cust_country)
VALUES(10000000011,
			'7033333333',
			'dylan.nguyen03@yahoo.com',
			'Dylan Nguyen',
			'Clearwater',
			'Fairfax',
			'VA',
			'22030',
			'US')

/* 
Challenge 2:
Make backup copies of your Orders and OrderItems tables.
*/
SELECT * INTO OrdersCopy FROM Orders;
SELECT * INTo OrderItemsCopy FRoM OrderItems;