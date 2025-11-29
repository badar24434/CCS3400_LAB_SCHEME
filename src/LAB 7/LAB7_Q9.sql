-- LAB7 - Question 9
-- Display employees hired before their managers
-- Show employee and manager names and hire dates
--
-- SOLUTION EXPLANATION:
-- Using self-join to connect employees with their managers
-- Comparing hire dates where employee.hire_date < manager.hire_date
-- Shows cases where subordinates were hired before their current managers

SELECT e.first_name || ' ' || e.last_name AS "Employee Name",
       e.hire_date AS "Employee Hire Date",
       m.first_name || ' ' || m.last_name AS "Manager Name",
       m.hire_date AS "Manager Hire Date"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date
ORDER BY e.hire_date;