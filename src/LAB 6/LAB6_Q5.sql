-- LAB6 - Question 5
-- Display employees working in location ID 1700
-- Show last name, department id, and job ID
--
-- SOLUTION EXPLANATION:
-- Using subquery to find all department_ids in location 1700
-- IN operator handles multiple departments that might be in same location
-- Main query finds employees in those departments

SELECT last_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM departments
                        WHERE location_id = 1700);