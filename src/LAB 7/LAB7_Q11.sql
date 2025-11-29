-- LAB7 - Question 11
-- Find employees who returned to their original job
-- Show employee IDs and job IDs of those with same current and original jobs
--
-- SOLUTION EXPLANATION:
-- Joining employees with job_history tables
-- Comparing current job_id with job_id from job history
-- This finds employees who changed jobs but returned to original position
-- Using DISTINCT to avoid duplicates if multiple job changes occurred

SELECT DISTINCT e.employee_id, e.job_id
FROM employees e
JOIN job_history jh ON e.employee_id = jh.employee_id
WHERE e.job_id = jh.job_id
ORDER BY e.employee_id;