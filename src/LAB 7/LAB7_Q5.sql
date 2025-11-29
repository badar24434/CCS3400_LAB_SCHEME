-- LAB7 - Question 5
-- Display all employees including King (who has no manager)
-- Order by employee number
--
-- SOLUTION EXPLANATION:
-- Using LEFT JOIN instead of INNER JOIN to include employees without managers
-- This will show King (and any others) who have NULL manager_id
-- LEFT JOIN ensures all employees from left table (e) are included

SELECT e.last_name AS "Employee",
       e.employee_id AS "Emp#",
       m.last_name AS "Manager",
       m.employee_id AS "Mgr#"
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id
ORDER BY e.employee_id;