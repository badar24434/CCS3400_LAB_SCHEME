-- LAB2 - Question 15
-- Display all data from EMPLOYEES table with columns separated by commas
-- Name the column title THE_OUTPUT
--
-- SOLUTION EXPLANATION:
-- Concatenating all columns from the employees table with commas as separators
-- Using || operator to join all fields into one output column
-- Converting all values to strings and handling potential NULL values

SELECT employee_id || ',' || 
       NVL(first_name, 'NULL') || ',' || 
       last_name || ',' || 
       email || ',' || 
       NVL(phone_number, 'NULL') || ',' || 
       hire_date || ',' || 
       job_id || ',' || 
       NVL(TO_CHAR(salary), 'NULL') || ',' || 
       NVL(TO_CHAR(commission_pct), 'NULL') || ',' || 
       NVL(TO_CHAR(manager_id), 'NULL') || ',' || 
       NVL(TO_CHAR(department_id), 'NULL') AS "THE_OUTPUT"
FROM employees;