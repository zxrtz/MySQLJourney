/*
 * Lesson 17. Creating and Manipulating Tables
 *
 * CREATE TABLE, DEFAULT, NOT NULL
 * DROP TABLE
 * ALTER TABLE, DROP COLUMN, ADD (field)
 * RENAME (sp_rename)
 * 
 */

 --DROP TABLE NewProducts;
 --DROP TABLE NewVendors;
 --DROP TABLE NewOrderItems;

 /*
  * CREATE TABLE: make a new table
  *		syntax for fields: name, datatype syntax, values
  */
 CREATE TABLE NewProducts(
	prod_id      CHAR(10)        NOT NULL,
    vend_id      CHAR(10)        NOT NULL,
    prod_name    CHAR(254)       NOT NULL,
    prod_price   DECIMAL(8,2)    NOT NULL,
    prod_desc    VARCHAR(1000)   NULL

 )

 -- unspecified means NULL is assumed (default)
CREATE TABLE NewVendors
(
    vend_id        CHAR(10)    NOT NULL,
    vend_name      CHAR(50)    NOT NULL,
    vend_address   CHAR(50)    ,
    vend_city      CHAR(50)    ,
    vend_state     CHAR(5)     ,
    vend_zip       CHAR(10)    ,
    vend_country   CHAR(50)
);

-- DEFAULT: define default values when creating a table
CREATE TABLE NewOrderItems (
	order_num INTEGER NOT NULL,
	order_item INTEGER NOT NULL,
	prod_id CHAR(10) NOT NULL,
	quantity INTEGER NOT NULL DEFAULT 1,
	item_price DECIMAL(8,2) NOT NULL
);

/*
 * ALTER TABLE: update table definitions (properties)
 *	do not do if there's data in rows
 */
ALTER TABLE Vendors
ADD vend_phone CHAR(20) DEFAULT 0;

/*
 * DROP COLUMN: delete column (doesnt work in all DBMSs)
 */
 ALTER TABLE Vendors
 DROP COLUMN vend_phone;


-- copy new table
SELECT * INTO NewVendors3 FROM Vendors;

-- add field
ALTER TABLE NewVendors3
ADD vend_continent CHAR(30);

/*
 * DROP TABLE: delete table
 */
-- finally delete table
DROP TABLE NewVendors3;


/*
 * RENAME (sp_rename in server)
 * check documentation
 */

 -- Challenge 1: add (vend_web) to the Vendors table. You need a text field big enough to accommodate a URL.
 ALTER TABLE Vendors
 ADD vend_web CHAR(100);

 -- Challenge 2: Use UPDATE statements to update Vendor records to include a website (you can make up any address).
 UPDATE Vendors
 SET vend_web = 'google.com';

 SELECT * FROM Vendors