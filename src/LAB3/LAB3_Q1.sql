-- LAB3 - Question 1
-- Find information about employee with last name Higgins
-- Display full name, department id, and salary
--
-- SOLUTION EXPLANATION:
-- Using WHERE clause to filter by last_name = 'Higgins'
-- Concatenating first_name and last_name for full name
-- Selecting department_id and salary as required

SELECT first_name || ' ' || last_name AS "Full Name",
       department_id,
       salary
FROM employees
WHERE last_name = 'Higgins';