-- LAB5 - Question 9
-- Display average salary of employees in departments 50 and 60
--
-- SOLUTION EXPLANATION:
-- Using WHERE clause to filter for departments 50 and 60
-- GROUP BY to separate results by department
-- AVG function calculates average salary for each department
-- Shows comparative average salaries between these two departments

SELECT department_id,
       ROUND(AVG(salary)) AS "Average Salaries"
FROM employees
WHERE department_id IN (50, 60)
GROUP BY department_id
ORDER BY department_id;