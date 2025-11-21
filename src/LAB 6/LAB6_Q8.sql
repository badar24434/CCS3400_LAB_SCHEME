-- LAB6 - Question 8
-- Display employees who don't work as IT PROG but earn less than ALL IT PROG employees
--
-- SOLUTION EXPLANATION:
-- Using subquery with ALL operator to find maximum salary of IT_PROG employees
-- Main query excludes IT_PROG employees (job_id != 'IT_PROG')
-- Finds employees earning less than the lowest-paid IT programmer
-- ALL means salary must be less than every IT_PROG salary

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id != 'IT_PROG'
AND salary < ALL (SELECT salary
                  FROM employees
                  WHERE job_id = 'IT_PROG');