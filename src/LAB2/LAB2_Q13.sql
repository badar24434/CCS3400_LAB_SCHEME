-- LAB2 - Question 13
-- Create descriptive column headings: Emp#, Employee, Job, and Hire Date
--
-- SOLUTION EXPLANATION:
-- Using column aliases to provide more descriptive headers
-- "Emp#" for employee_id, "Employee" for last_name, "Job" for job_id, "Hire Date" for hire_date
-- Quoted aliases are used when they contain special characters or spaces

SELECT employee_id AS "Emp#", 
       last_name AS "Employee", 
       job_id AS "Job", 
       hire_date AS "Hire Date"
FROM employees;