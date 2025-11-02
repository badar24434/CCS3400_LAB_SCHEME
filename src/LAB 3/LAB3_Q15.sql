-- LAB3 - Question 15
-- Find clerks hired after 1997
--
-- SOLUTION EXPLANATION:
-- Using LIKE operator to find job titles containing 'CLERK'
-- Using comparison operator to find hire dates after 1997
-- TO_CHAR extracts year from hire_date for comparison

SELECT last_name, job_id, hire_date
FROM employees
WHERE job_id LIKE '%CLERK%'
AND TO_CHAR(hire_date, 'YYYY') > '1997';