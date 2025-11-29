-- LAB7 - Question 6
-- Display employees with their colleagues (same department)
-- Show employee names, department numbers, and colleague names
--
-- SOLUTION EXPLANATION:
-- Using self-join on employees table through department_id
-- 'e1' for main employee, 'e2' for colleagues
-- Filtering out self-matches with e1.employee_id != e2.employee_id
-- Shows all employees who work in the same department

SELECT e1.last_name AS "Employee",
       e1.department_id AS "Department",
       e2.last_name AS "Colleague"
FROM employees e1
JOIN employees e2 ON e1.department_id = e2.department_id
WHERE e1.employee_id != e2.employee_id
ORDER BY e1.last_name, e2.last_name;