-- LAB4 - Question 5
-- Add column showing increase amount (new salary - old salary)
-- Building on Question 4
--
-- SOLUTION EXPLANATION:
-- Extending Q4 by adding calculation for the increase amount
-- Subtracting original salary from new salary to show increase
-- Using same 15.5% calculation as in Q4

SELECT employee_id,
       last_name,
       salary,
       ROUND(salary * 1.155) AS "New Salary",
       ROUND(salary * 1.155) - salary AS "Increase"
FROM employees;