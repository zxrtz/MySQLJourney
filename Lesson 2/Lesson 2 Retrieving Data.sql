
-- Using the select query, select certain column. 
-- whitespacing doesnt matter until adding a ;
SELECT prod_name FROM Products;

-- Select multiple columns
SELECT prod_id,prod_name,prod_price
FROM Products;

-- Select all columns
SELECT * FROM Products;



-- Retrieve Distinct (unique) Rows and Values
SELECT DISTINCT vend_id FROM Products;

-- Retrieve all Distinct COMBINATIONS of Multiple Cols
SELECT DISTINCT vend_id, prod_name FROM Products;


-- select head of column of "n" rows (Microsoft SQL Server)
SELECT TOP 5 prod_name FROM Products;

-- alternate top 5 for most DBMSs: top 5 with starting from 5th element
-- SELECT prod_name FROM Products LIMIT 5 OFFSET 5;

/*
 * Challenge 1: write SQL statment to retrieve all customer IDs (cust_id) from Customers table
 */
SELECT cust_id from Customers;

/*
 * Challenge 2: Write a SQL statement to retrieve a list of the products (prod_id) ordered (not every order, just a unique list of products).
 */
SELECT DISTINCT prod_id FROM OrderItems;

/*
 * Challenge 3: Write a SQL statement that retrieves all columns from the Customers table 
 * and an alternate SELECT that retrieves just the customer ID. Use comments to comment out one SELECT so as to be able to run the other. 
 */
 -- SELECT * FROM Customers;
 SELECT cust_id FROM Customers;