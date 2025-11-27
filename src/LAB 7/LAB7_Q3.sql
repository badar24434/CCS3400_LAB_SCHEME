-- LAB7 - Question 3
-- Display employees who work in Toronto
-- Show last name, job, department number, and department name
--
-- SOLUTION EXPLANATION:
-- Joining employees, departments, and locations tables
-- Filtering for city = 'Toronto' in the locations table
-- Multi-table join to connect employee location through departments

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';