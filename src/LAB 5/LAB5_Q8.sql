-- LAB5 - Question 8
-- Display departments with total salary more than 25000
--
-- SOLUTION EXPLANATION:
-- Using GROUP BY to group by department
-- SUM function to calculate total salary per department
-- HAVING clause filters groups where total salary > 25000
-- HAVING is used instead of WHERE because we're filtering grouped results

SELECT department_id, 
       SUM(salary) AS "Total Salary"
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING SUM(salary) > 25000
ORDER BY department_id;