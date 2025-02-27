/*
 * Lesson 21: Using Cursors

 -- gets the "result set" that can be viewed by the database 

DECLARE CursorName CURSOR
FOR
SELECT * blabbla
 */

 DECLARE CustCursor CURSOR
 FOR
 SELECT * FROM Customers
 WHERE cust_email IS NULL;

 /*
  * OPEN CURSOR: access cursor
  * CLOSE CURSOR
  */
 OPEN CustCursor;
 CLOSE CustCursor;


 /*
  * FETCH: gets data from cursor
  */
  DECLARE @cust_id CHAR(10),
        @cust_name CHAR(50),
        @cust_address CHAR(50),
        @cust_city CHAR(50),
        @cust_state CHAR(5),
        @cust_zip CHAR(10),
        @cust_country CHAR(50),
        @cust_contact CHAR(50),
        @cust_email CHAR(255)
	Open CustCursor
	FETCH NEXT FROM CustCursor
	INTO @cust_id, @cust_name, @cust_address,
         @cust_city, @cust_state, @cust_zip,
         @cust_country, @cust_contact, @cust_email
	-- using a while loop instead of using a single fetch for a single row...
	WHILE @@FETCH_STATUS = 0 -- while loop! while there are rows to be fetched
	BEGIN
	FETCH NEXT FROM CustCursor
		INTO @cust_id, @cust_name, @cust_address,
         @cust_city, @cust_state, @cust_zip,
         @cust_country, @cust_contact, @cust_email
	END
	CLOSE CustCursor;

	/*
	 * DEALLOCATE: REMOVE CURSOR because it uses resources
	 */
	 DEALLOCATE CustCursor;