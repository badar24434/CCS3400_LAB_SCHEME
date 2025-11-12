-- LAB5 - Question 5
-- Display the number of people with the same job id
--
-- SOLUTION EXPLANATION:
-- Using COUNT(*) with GROUP BY job_id
-- Shows how many employees have each job type
-- Useful for understanding workforce distribution

SELECT job_id, 
       COUNT(*) AS "Number of Employees"
FROM employees
GROUP BY job_id
ORDER BY job_id;