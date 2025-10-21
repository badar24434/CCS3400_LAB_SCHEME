-- LAB2 - Question 11
-- Display all unique job codes from the EMPLOYEES table
--
-- SOLUTION EXPLANATION:
-- Using DISTINCT keyword to eliminate duplicate job codes
-- This shows only unique/different job_id values from the employees table

SELECT DISTINCT job_id
FROM employees;