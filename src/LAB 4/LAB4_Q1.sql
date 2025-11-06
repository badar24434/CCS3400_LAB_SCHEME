-- LAB4 - Question 1
-- Display employee id, concatenated names, last name length, and position of 'a' in last name
-- for employees whose last name ends with 'n'
--
-- SOLUTION EXPLANATION:
-- Using string functions: concatenation (||), LENGTH(), INSTR()
-- INSTR finds the position of 'a' in the last name
-- WHERE clause filters names ending with 'n' using LIKE '%n'

SELECT employee_id,
       first_name || ' ' || last_name AS "Full Name",
       LENGTH(last_name) AS "Last Name Length",
       INSTR(last_name, 'a') AS "Position of 'a'"
FROM employees
WHERE last_name LIKE '%n';