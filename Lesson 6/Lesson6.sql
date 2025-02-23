/*
 * Lesson 6: Wildcard Filtering
 */


/* 
 * LIKE predicate
 * % wildcard
 * % wildcard doesn't match NULL
 */
 -- must start with Fish in string value
 SELECT prod_id,prod_name
 FROM Products
 WHERE prod_name LIKE 'Fish%';

 -- Fish can be anywhere in string value
 SELECT prod_id,prod_name
 FROM Products
 WHERE prod_name LIKE '%Fish%';

 -- all prod_names that begin with F and end with y
 SELECT prod_id,prod_name
 FROM Products
 WHERE prod_name LIKE 'F%y';
 -- add extra % after last character just in case of extra padding by DBMS
 -- or trim spaces using functions


 /*
  * UNDERSCORE wildcard
  * matches any single character
  */
  SELECT prod_id,prod_name
  FROM Products
  WHERE prod_name LIKE '_ inch teddy bear';
  -- two characters using two underscores
  SELECT prod_id,prod_name
  FROM Products
  WHERE prod_name LIKE '__ inch teddy bear';


  /*
   * Brackets [] Wildcard
   * specify a set of characters, any one of which must match a character in the specified position (the location of the wildcard)
   */
   -- If name starts with J or M, it will be included
   SELECT cust_contact
   FROM Customers
   WHERE cust_contact LIKE '[JM]%'
   ORDER BY cust_contact;

   -- Can be negated using ^. Will include any row without J or M in 0th index.
   SELECT cust_contact
   FROM	 Customers
   WHERE cust_contact LIKE '[^JM]%'
   ORDER BY cust_contact;
   -- same thing as carat by using NOT
   SELECT cust_contact
   FROM	 Customers
   WHERE NOT cust_contact LIKE '[^JM]%'
   ORDER BY cust_contact;
   
   
	/*
	 * CHALLENGE 1:
	 * retrieve the product name (prod_name) and description (prod_desc) from the Products table, returning only products where the word toy is in the description
	 */
	 SELECT prod_name, prod_desc
	 FROM Products
	 WHERE prod_desc LIKE '%toy%';


	/*
	 * CHALLENGE 2:
	 * retrieve the product name (prod_name) and description (prod_desc) from the Products table, returning only products where the word toy doesn’t appear in the descriptio
	 */
	 SELECT prod_name, prod_desc
	 FROM Products
	 WHERE prod_desc NOT LIKE '%toy%'
	 ORDER BY prod_desc;

	/*
	 * CHALLENGE 3:
	 * retrieve the product name (prod_name) and description (prod_desc) from the Products table, returning only products where both the words toy and carrots appear in the description
	 */
	 SELECT prod_name, prod_desc
	 FROM Products
	 WHERE prod_desc LIKE '%toy%' AND prod_desc LIKE '%carrots%';

	/*
	 * CHALLENGE 4: retrieve the product name (prod_name) and description (prod_desc) from the Products table,
	 * returning only products where both the words toy and carrots appear in the description in that order (the word toy before the word carrots)
	 */
	 SELECT prod_name, prod_desc
	 FROM Products
	 WHERE prod_desc LIKE '%toy%carrots%';