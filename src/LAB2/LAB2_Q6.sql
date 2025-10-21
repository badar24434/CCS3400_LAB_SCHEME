-- LAB2 - Question 6
-- Add a column to store customer's phone number
--
-- SOLUTION EXPLANATION:
-- Using ALTER TABLE statement to add a new column 'Phone_Number'
-- VARCHAR2 is appropriate for phone numbers as they may contain special characters

ALTER TABLE CUSTOMERS 
ADD Phone_Number VARCHAR2(20);

-- Verify the table structure
DESC CUSTOMERS;

-- View current data to see the new column
SELECT * FROM CUSTOMERS;