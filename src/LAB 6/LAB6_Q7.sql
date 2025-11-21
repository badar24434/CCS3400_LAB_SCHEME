-- LAB6 - Question 7
-- Display employees in Sales department
-- Show department number, last name, and job ID
--
-- SOLUTION EXPLANATION:
-- Using subquery to find Sales department's ID
-- Main query retrieves employees from that department
-- Shows department structure for Sales team

SELECT department_id, last_name, job_id
FROM employees
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE department_name = 'Sales');