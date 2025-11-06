-- LAB4 - Question 12
-- Rewrite Question 11 using CASE syntax instead of DECODE
--
-- SOLUTION EXPLANATION:
-- CASE statement provides more readable conditional logic
-- WHEN clauses test each job_id value
-- ELSE provides default value for unmatched jobs
-- Same logic as Q11 but with modern CASE syntax

SELECT last_name,
       job_id,
       CASE job_id
           WHEN 'AD_PRES' THEN 'A'
           WHEN 'ST_MAN' THEN 'B'
           WHEN 'IT_PROG' THEN 'C'
           WHEN 'SA_REP' THEN 'D'
           WHEN 'ST_CLERK' THEN 'E'
           ELSE '0'
       END AS "GRADE"
FROM employees;