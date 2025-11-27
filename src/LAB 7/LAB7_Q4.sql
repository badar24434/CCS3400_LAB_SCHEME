-- LAB7 - Question 4
-- Display employees with their managers
-- Show employee name/number and manager name/number with labels
--
-- SOLUTION EXPLANATION:
-- Using self-join on employees table
-- 'e' alias for employees, 'm' alias for managers
-- Joining employee.manager_id with manager.employee_id
-- Column aliases provide descriptive labels

SELECT e.last_name AS "Employee",
       e.employee_id AS "Emp#",
       m.last_name AS "Manager",
       m.employee_id AS "Mgr#"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
ORDER BY e.employee_id;