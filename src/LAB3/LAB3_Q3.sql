-- LAB3 - Question 3
-- Display last name and department number for employee number 201
--
-- SOLUTION EXPLANATION:
-- Using WHERE clause to filter by employee_id = 201
-- Selecting last_name and department_id (department number)

SELECT last_name, department_id
FROM employees
WHERE employee_id = 201;