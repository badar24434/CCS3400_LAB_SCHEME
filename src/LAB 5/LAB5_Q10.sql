-- LAB5 - Question 10
-- Display manager number and lowest-paid employee salary for each manager
-- Exclude unknown managers and groups with minimum salary <= $6000
-- Sort by salary descending
--
-- SOLUTION EXPLANATION:
-- GROUP BY manager_id to group employees by their manager
-- MIN function finds lowest salary for each manager's team
-- WHERE excludes employees without known managers
-- HAVING excludes groups where minimum salary is $6000 or less
-- ORDER BY DESC sorts highest minimum salaries first

SELECT manager_id AS "Manager Number",
       MIN(salary) AS "Lowest Salary"
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 6000
ORDER BY MIN(salary) DESC;