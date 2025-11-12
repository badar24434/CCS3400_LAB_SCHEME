-- LAB5 - Question 11
-- Display job, salary by department, and total salary for each job
-- Include only departments 20, 50, 80, and 90
--
-- SOLUTION EXPLANATION:
-- Using GROUP BY with ROLLUP or multiple GROUP BY queries
-- First part shows salary by job and department
-- ROLLUP provides subtotals for each job across all departments
-- WHERE clause limits to specified departments

SELECT job_id AS "Job",
       department_id AS "Department", 
       SUM(salary) AS "Department Total"
FROM employees
WHERE department_id IN (20, 50, 80, 90)
GROUP BY job_id, department_id

UNION ALL

SELECT job_id AS "Job",
       NULL AS "Department",
       SUM(salary) AS "Job Total"
FROM employees  
WHERE department_id IN (20, 50, 80, 90)
GROUP BY job_id
ORDER BY 1, 2 NULLS LAST;