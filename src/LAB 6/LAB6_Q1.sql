-- LAB6 - Question 1
-- Display employee number and full name from Sales department
-- Rename columns as "Id" and "Names"
--
-- SOLUTION EXPLANATION:
-- Using subquery to find department_id for 'Sales' department
-- Concatenating first_name and last_name for full name
-- Column aliases provide required column names

SELECT employee_id AS "Id",
       first_name || ' ' || last_name AS "Names"
FROM employees
WHERE department_id = (SELECT department_id 
                       FROM departments 
                       WHERE department_name = 'Sales');