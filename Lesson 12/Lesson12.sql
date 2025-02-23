/*
 * Lesson 12
 * Joining Tables
 * (Relational Database Joining)
 */

 /*
  * Joining Tables
  */
  -- Vendors and Products using vend_id as a primary key
  SELECT vend_name, prod_name, prod_price
  FROM Vendors, Products
  WHERE Vendors.vend_id = Products.vend_id;

