-- LAB6 - Question 3
-- Display employees who earn more than average salary
-- Sort by salary ascending
--
-- SOLUTION EXPLANATION:
-- Using subquery to calculate average salary across all employees
-- Main query filters employees with salary > average
-- ORDER BY sorts results in ascending order of salary

SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees)
ORDER BY salary;