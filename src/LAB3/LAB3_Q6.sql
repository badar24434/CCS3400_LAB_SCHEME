-- LAB3 - Question 6
-- Display employees in departments 20 or 50
-- Show last name and department number, ordered alphabetically by name
--
-- SOLUTION EXPLANATION:
-- Using IN operator to filter for departments 20 and 50
-- ORDER BY last_name sorts results in ascending alphabetical order

SELECT last_name, department_id
FROM employees
WHERE department_id IN (20, 50)
ORDER BY last_name;