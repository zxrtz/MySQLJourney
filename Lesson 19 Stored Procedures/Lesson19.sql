/*
 * Lesson 19: Stored Procedures
 *
 */

 -- CREATE PROCEDURE: basically a function
 -- DECLARE basically defining a variable
 CREATE PROCEDURE MailingListCount
 AS
 DECLARE @cnt INTEGER
 SELECT @cnt = COUNT(*)
 FROM Customers
 WHERE cust_email IS NOT NULL;
 RETURN @cnt;

 -- invoke procedure with return value as argument?
 DECLARE @ReturnValue INT
 EXECUTE @ReturnValue=MailingListCount;
 SELECT @ReturnValue;


 /*
  * another procedure example
  * gets the order number for the next order (max + 1), then insert an order with the new order number and cust_id argument
  */
CREATE PROCEDURE NewOrder @cust_id CHAR(10)
AS
-- Declare variable for order number
DECLARE @order_num INTEGER
-- Get current highest order number
SELECT @order_num=MAX(order_num)
FROM Orders
-- Determine next order number
SELECT @order_num=@order_num+1
-- Insert new order
INSERT INTO Orders(order_num, order_date, cust_id)
VALUES(@order_num, GETDATE(), @cust_id)
-- Return order number
RETURN @order_num;


/*
 * alternate to the one above
 */
 -- CREATE PROCEDURE nameOfProcedure newArg argSyntax
 CREATE PROCEDURE NewOrder @cust_id CHAR(10)
 AS
 INSERT INTO Orders(cust_id)
 VALUES(@cust_id)
 SELECT order_num = @@IDENTITY;



