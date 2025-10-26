-- LAB3 - Question 2
-- Display employees who earn more than $10000
-- Show last name and salary
--
-- SOLUTION EXPLANATION:
-- Using WHERE clause with comparison operator (>) to filter salaries greater than 10000
-- Selecting last_name and salary columns

SELECT last_name, salary
FROM employees
WHERE salary > 10000;