/*
 * Lesson 22: Advanced SQL Features

	PRIMARY KEYS 
	FOREIGN KEYS
	UNIQUE CONSTRAINTS
	CHECK CONSTRAINTS (conditional fields)
	INDEX
	TRIGGERS
 */


 /*
  * CREATE PRIMARY KEY WHEN CREATING TABLE
  */
  CREATE TABLE VendorPrimaryKey (
	vend_id CHAR(10) NOT NULL PRIMARY KEY,
	vend_name CHAR(50) NOT NULL
	-- etc
  );

/*
 * ADD CONSTRAINT PRIMARY KEY: Create new primary key
 */
  ALTER TABLE VendorPrimaryKey
  ADD CONSTRAINT PRIMARY KEY vend_id;

/*
 * FOREIGN KEY: DEPENDENT REFERENCE TO ANOTHER TABLE'S PRIMARY KEY
 * foreign keys can only match the values in the primary key field of the referred table
 * can be used to prevent accidental deletion
 */
  CREATE TABLE Orders (
	order_num INTEGER NOT NULL PRIMARY KEY,
	order_date DATETIME NOT NULL,
	cust_id CHAR(10) NOT NULL REFERENCES Customers(cust_id) -- foreign ID refers to Customers primary key (cust_id)
  );

/*
 * FOREIGN KEY in ALTER TABLE
 */
ALTER TABLE Orders
ADD CONSTRAINT
FOREIGN KEY (cust_id) REFERENCES Customers (cust_id);



/*
 * UNIQUE: used with ADD CONSTRAINT when CREATE TABLE or ALTER TABLE
 */

 /*
  * CONDITIONAL CONSTRAINTS:
  * used to make sure fields contain a criteria
  */
  CREATE TABLE OrderItems (
	order_num INTEGER NOT NULL,
	order_item INTEGER NOT NULL,
	prod_id CHAR(10) NOT NULL,
	quantity INTEGER NOT NULL CHECK (quantity > 0),
	item_price MONEY NOT NULL
  );

  -- check for M or F for field gender
ALTER TABLE Gender
ADD CONSTRAINT CHECK (gender LIKE '[MF]');


/*
 * INDEX
 */
CREATE INDEX prod_name_ind
ON Products (prod_name);


/*
 * TRIGGERS: execution of special stored procedures upon certain actions
 */
 -- convert cust_state to uppercase on all INSERT and UPDATE operations
 -- ensures data accuracy
 CREATE TRIGGER customer_state
 ON Customers
 FOR INSERT, UPDATE
 AS
 UPDATE Customers
 SET cust_state = Upper(cust_state)
 WHERE Customers.cust_id = inserted.cust_id;

