-- LAB6 - Question 6
-- Display employees who report to King
-- Show last name and salary
--
-- SOLUTION EXPLANATION:
-- Using subquery to find King's employee_id
-- Main query finds employees whose manager_id matches King's employee_id
-- Shows all direct reports to King

SELECT last_name, salary
FROM employees
WHERE manager_id = (SELECT employee_id
                    FROM employees
                    WHERE last_name = 'King');