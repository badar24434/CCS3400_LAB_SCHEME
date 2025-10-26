-- LAB3 - Question 10
-- Display employees who do not have a manager
-- Show last name and job title
--
-- SOLUTION EXPLANATION:
-- Using IS NULL to find employees with no manager (manager_id is NULL)
-- Joining with jobs table to get job title

SELECT e.last_name, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.manager_id IS NULL;