-- LAB4 - Question 11
-- Use DECODE function to assign grades based on job_id
--
-- SOLUTION EXPLANATION:
-- DECODE function works like a lookup table
-- Tests job_id against multiple values and returns corresponding grade
-- Default value '0' for jobs not in the list
-- Job grades: AD_PRES=A, ST_MAN=B, IT_PROG=C, SA_REP=D, ST_CLERK=E

SELECT last_name,
       job_id,
       DECODE(job_id,
              'AD_PRES', 'A',
              'ST_MAN', 'B', 
              'IT_PROG', 'C',
              'SA_REP', 'D',
              'ST_CLERK', 'E',
              '0') AS "GRADE"
FROM employees;