/*
 * Lesson 22: Advanced SQL Features
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

