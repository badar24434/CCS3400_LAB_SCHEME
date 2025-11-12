-- LAB5 - Question 7
-- Find difference between highest and lowest salaries
--
-- SOLUTION EXPLANATION:
-- Using MAX and MIN functions to find highest and lowest salary
-- Subtracting MIN from MAX to get the difference
-- Shows the salary range/spread in the company

SELECT MAX(salary) - MIN(salary) AS "DIFFERENCE"
FROM employees;