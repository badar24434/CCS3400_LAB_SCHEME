-- LAB3 - Question 4
-- Find high-salary and low-salary employees (NOT in range $5000 to $12000)
-- Display last name and salary
--
-- SOLUTION EXPLANATION:
-- Using NOT BETWEEN operator to find salaries outside the range 5000-12000
-- This will show employees earning less than $5000 OR more than $12000

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;