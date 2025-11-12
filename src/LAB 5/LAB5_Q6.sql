-- LAB5 - Question 6
-- Count number of managers without listing them
-- Use MANAGER_ID column to determine managers
--
-- SOLUTION EXPLANATION:
-- Using COUNT with DISTINCT on manager_id
-- This counts unique manager IDs, showing how many people are managers
-- Excludes NULL values (employees who don't manage anyone)

SELECT COUNT(DISTINCT manager_id) AS "Number of Managers"
FROM employees
WHERE manager_id IS NOT NULL;