-- LAB2 - Question 10
-- Display last name, job code, hire date and employee number with employee number first
-- Provide alias STARTDATE for HIRE_DATE column
--
-- SOLUTION EXPLANATION:
-- Selecting required columns in specified order: employee_id first, then others
-- Using column alias 'STARTDATE' for hire_date column
-- job_id represents the job code

SELECT employee_id, last_name, job_id, hire_date AS STARTDATE
FROM employees;