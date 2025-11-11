-- LAB5 - Question 2
-- Display department id and total salary spent on each department
--
-- SOLUTION EXPLANATION:
-- Using GROUP BY to group employees by department
-- SUM function calculates total salary for each department
-- Shows how much the company spends on salaries per department

SELECT department_id, 
       SUM(salary) AS "Total Salary"
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
ORDER BY department_id;