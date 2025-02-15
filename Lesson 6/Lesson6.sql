/*
 * Lesson 6: Wildcard Filtering
 */


/* 
 * LIKE predicate
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
 -- add extra % after last character just in case of extra padding


 /*
  *
  */