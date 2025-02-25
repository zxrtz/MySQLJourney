/*
 * Lesson 8:
 * Using Data Manipulation Functions
 */

 ---------------------- text manipulation

/*
 * the UPPER function:
 * transforms text into full uppercase
 */
 SELECT UPPER(vend_name) AS vend_name_upper
 FROM Vendors
 ORDER BY vend_name;

/*
 * other text manipulation functions:
 * LEFT() or using substring
 * LENGTH() length of text
 * LOWER() lowercase
 * LTRIM() remove padding on left
 * RIGHT() or using substring
 * RTRIM() remove padding on right
 * SUBSTR() or SUBSTRING()
 * SOUNDEX() returns a strings SOUNDEX value
 * UPPER() uppercase
 */

/*
 * SOUNDEX() function: converts text into alphanumeric pattern describing phonetics
 */
 SELECT SOUNDEX(vend_name) AS vend_name_soundex FROM Vendors;

-- Using SOUNDEX(): search for name that "sounds" like Michael Green, returning Michelle Green
 SELECT cust_name,cust_contact
 FROM Customers
 WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

 ---------------------------- end of text manipulation



 ---------------------------- date and time manip.

/*
 * DATEPART() function
 * extracts certain dates such as by year
 * requires parameters: 
 * the part of the value to return and the specific date to return
 */
 SELECT order_num
 FROM Orders
 WHERE DATEPART(yy, order_date) = 2020
 -- can also use DATE_PART in other DBMSs


/*
 * POSTGRESQL ONLY:
 * EXTRACT() function:
 * extracts values in a certain format, especially dates
 */
--SELECT order_num
--FROM Orders
--WHERE EXTRACT(year FROM order_date) = 2020;


/*
 * ORACLE SPECIFIC:
 * BETWEEN operator can also be used to find dates in between a time frame
 * additionally, need to use to_date() function with this*
 */
-- SELECT order_num
-- FROM orders
-- WHERE order_date BETWEEN to_date('2020-01-01', 'yyyy-mm-dd') AND to_date('2020-12-31','yyyy-mm-dd');

----------------------------------- end date and time manip

---------------------------------- start numeric functions

/*
 * ABS() return absolute value
 * COS() cosine
 * EXP() exponential value
 * PI() pi
 * SIN() sine
 * SQRT() sqrt
 * TAN() tangent
 */

---------------------------------- end numeric functions


/*
 * Challenge 1:
 * returns customer ID (cust_id), customer name (cust_name), and user_login, 
 * which is all uppercase and composed of the first two characters of the customer contact (cust_contact) 
 * and the first three characters of the customer city (cust_city). 
 */
SELECT UPPER(cust_id),
	UPPER(cust_name),
	UPPER(SUBSTRING(cust_contact, 0, 3)) + SUBSTRING(LTRIM(cust_city),0,4) AS user_login
FROM Customers;


/*
 * Challenge 2:
 * return the order number (order_num) and order date (order_date) for all orders placed in January 2020, sorted by order date. 
 */
SELECT order_num,
	order_date
FROM Orders
WHERE DATEPART(yy,order_date) = 2020 AND DATEPART(mm,order_date) = 01;