-- LAB2 - Question 7
-- Remove the CUSTOMERS table from the database
--
-- SOLUTION EXPLANATION:
-- Using DROP TABLE statement to completely remove the CUSTOMERS table
-- This will delete the table structure and all data permanently

DROP TABLE CUSTOMERS;

-- Verify the table has been dropped (this should give an error)
-- DESC CUSTOMERS;