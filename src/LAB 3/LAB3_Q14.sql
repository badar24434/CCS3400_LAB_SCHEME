-- LAB3 - Question 14
-- Display employees who are sales representatives or stock clerks
-- with salaries NOT equal to $2500, $3500, or $7000
--
-- SOLUTION EXPLANATION:
-- Using IN operator for job types (SA_REP, ST_CLERK)
-- Using NOT IN operator to exclude specific salary amounts
-- AND operator combines both conditions

SELECT last_name, job_id, salary
FROM employees
WHERE job_id IN ('SA_REP', 'ST_CLERK')
AND salary NOT IN (2500, 3500, 7000);