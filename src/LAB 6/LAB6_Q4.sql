-- LAB6 - Question 4
-- Display employees who hold the same positions as Grant
--
-- SOLUTION EXPLANATION:
-- Using subquery to find Grant's job_id
-- Main query finds all employees with the same job_id
-- This will include Grant and anyone else with the same position

SELECT last_name, job_id
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE last_name = 'Grant');