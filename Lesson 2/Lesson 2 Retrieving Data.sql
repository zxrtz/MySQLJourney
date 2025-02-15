
-- Using the select query, demonstrate different methods of code syntax.
SELECT prod_name
FROM Products;

SELECT prod_name FROM Products;

SELECT
prod_name
FROM
Products;


-- Select multiple columns
SELECT prod_id,prod_name,prod_price
FROM Products;


-- Select all columns
SELECT * FROM Products;