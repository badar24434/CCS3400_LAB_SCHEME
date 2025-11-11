-- LAB5 - Question 4
-- Display minimum, maximum, sum and average salary for each job type
-- Modify Q3 to group by job_id
--
-- SOLUTION EXPLANATION:
-- Adding GROUP BY job_id to get statistics for each job type
-- Same aggregate functions as Q3 but grouped by job
-- Shows salary ranges and averages for different positions

SELECT job_id,
       ROUND(MIN(salary)) AS "Minimum",
       ROUND(MAX(salary)) AS "Maximum", 
       ROUND(SUM(salary)) AS "Sum",
       ROUND(AVG(salary)) AS "Average"
FROM employees
GROUP BY job_id
ORDER BY job_id;