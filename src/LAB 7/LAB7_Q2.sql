-- LAB7 - Question 2
-- Display all employees with their department information
-- Show last name, department number, and department name
--
-- SOLUTION EXPLANATION:
-- Using LEFT JOIN to include all employees (even those without departments)
-- Joining employees and departments tables on department_id
-- This ensures all employees are shown even if department_id is NULL

SELECT e.last_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
ORDER BY e.last_name;