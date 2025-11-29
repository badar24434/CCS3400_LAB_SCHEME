-- LAB7 - Question 10
-- Find department IDs that do NOT contain job ID ST_CLERK
-- Use set operators
--
-- SOLUTION EXPLANATION:
-- Using MINUS (set difference) operator
-- First query gets all department IDs
-- Second query gets department IDs that have ST_CLERK employees
-- MINUS returns departments that don't have ST_CLERK

SELECT DISTINCT department_id
FROM employees
WHERE department_id IS NOT NULL

MINUS

SELECT DISTINCT department_id  
FROM employees
WHERE job_id = 'ST_CLERK'
AND department_id IS NOT NULL

ORDER BY department_id;