-- LAB2 - Question 9
-- Determine the structure of the EMPLOYEES table
--
-- SOLUTION EXPLANATION:
-- Using DESC (DESCRIBE) to show the table structure
-- This displays column names, data types, and constraints

-- Show the structure of EMPLOYEES table
DESC EMPLOYEES;

-- Optional: Show sample data to understand the table better
SELECT * FROM EMPLOYEES WHERE ROWNUM <= 5;