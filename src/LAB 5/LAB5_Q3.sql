-- LAB5 - Question 3
-- Find highest, lowest, sum, and average salary of all employees
-- Round results to nearest whole number
--
-- SOLUTION EXPLANATION:
-- Using aggregate functions: MAX, MIN, SUM, AVG
-- ROUND function rounds to nearest whole number (0 decimal places)
-- Applies to all employees across the entire company

SELECT ROUND(MAX(salary)) AS "Maximum",
       ROUND(MIN(salary)) AS "Minimum", 
       ROUND(SUM(salary)) AS "Sum",
       ROUND(AVG(salary)) AS "Average"
FROM employees;