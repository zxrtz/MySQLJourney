/*
 * Lesson 7:
 * Calculated Fields
 */


/*
 * string concatenation
 */
SELECT vend_name + '(' + vend_country + ')'
FROM Vendors
ORDER BY vend_name;

/*
 * TRIM function removes space padding of a string
 * RTRIM removes all padding to the right of a string
 * LTRIM removes all paddign to the left of a string
 */
 -- RTRIM (right trim)
SELECT RTRIM(vend_name) + '(' + RTRIM(vend_country) + ')'
FROM Vendors
ORDER BY vend_name;

/*
 * AS function to rename column/field
 */
SELECT RTRIM(vend_name) + '(' + RTRIM(vend_country) + ')'
AS vend_title
FROM Vendors
ORDER BY vend_name;

/*
 * AS function used with WHERE function to rename calculated field
 */
 SELECT prod_id,
	quantity
	item_price,
	quantity*item_price AS expanded_price
FROM OrderItems
WHERE order_num = 20008;


/*
 * Challenge 1:
 * retrieves vend_id, vend_name, vend_address, and vend_city from Vendors, renaming vend_name to vname, vend_city to vcity, and vend_address to vaddress. 
 * Sort the results by vendor name (you can use the original name or the renamed name).
 */
SELECT vend_id, 
	vend_name AS vname, 
	vend_address AS vaddress,
	vend_city AS vcity
FROM Vendors
ORDER BY vend_name;

/*
 * Challenge 2:
 * Write a SQL statement that returns prod_id, prod_price, and sale_price from the Products table. 
 * sale_price is a calculated field that contains, well, the sale price. Here’s a hint: you can multiply by 0.9 to get 90% of the original value (and thus the 10% off price).
 */
SELECT prod_id,prod_price, prod_price*.9 AS sale_price
FROM Products
ORDER BY sale_price;
