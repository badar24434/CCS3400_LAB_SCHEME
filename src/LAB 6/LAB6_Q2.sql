-- LAB6 - Question 2
-- Find employees who are NOT sales person and earn more than minimum salary of Sales Manager
--
-- SOLUTION EXPLANATION:
-- Using subquery to find minimum salary of Sales Managers (SA_MAN)
-- Main query excludes Sales Representatives (SA_REP) 
-- Compares salary with subquery result using > operator

SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE job_id != 'SA_REP'
AND salary > (SELECT MIN(salary)
              FROM employees
              WHERE job_id = 'SA_MAN');