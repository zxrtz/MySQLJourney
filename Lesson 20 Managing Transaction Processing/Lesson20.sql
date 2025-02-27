/*
 * Lesson 20: Managing Transaction Processing
 */
 BEGIN TRANSACTION
 -- statements in this block must be entirely executed or none at all for sake of rollback purposes when editing DBs
 COMMIT TRANSACTION

 /*
  * ROLLBACK a transaction
  */
  ROLLBACK;

  /*
   * COMMIT: force explicit commit
   */
   BEGIN TRANSACTION
   DELETE OrderItems WHERE order_num =12345
   DELETE Orders WHERE order_num = 12345
   COMMIT TRANSACTION;
   -- undo the delete of order_num 12345
   ROLLBACK;
   SELECT * FROM OrderItems;

   -- SAVEPOINT/SAVE TRANSACTION: for restoring partial transactions
   SAVE TRANSACTION delete1;
   ROLLBACK TRANSACTION delete1;


   -- example of SAVEPOINTs inside of full transaction
   BEGIN TRANSACTION
	INSERT INTO Customers(cust_id, cust_name)
	VALUES(1000000010, 'Toys Emporium');
	SAVE TRANSACTION StartOrder;
	INSERT INTO Orders(order_num, order_date, cust_id)
	VALUES(20100,'2020/12/1',1000000010);
	IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOrder;
	INSERT INTO OrderItems(order_num, order_item,
	prod_id, quantity, item_price)
	VALUES(20100, 1, 'BR01', 100, 5.49);
	IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOrder;
	INSERT INTO OrderItems(order_num, order_item,
	prod_id, quantity, item_price)
	VALUES(20100, 2, 'BR03', 100, 10.99);
	IF @@ERROR <> 0 ROLLBACK TRANSACTION StartOrder;
	COMMIT TRANSACTION
	-- checks for error codes (0 = no error), and if so, do a rollback to the first transaction.
