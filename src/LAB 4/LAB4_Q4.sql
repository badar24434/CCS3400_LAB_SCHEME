-- LAB4 - Question 4
-- Display employee number, last name, salary, and salary increased by 15.5%
-- Express new salary as whole number using ROUND
--
-- SOLUTION EXPLANATION:
-- Calculating 15.5% increase: salary * 1.155
-- ROUND function converts to whole number (no decimals)
-- Column alias provides descriptive label

SELECT employee_id,
       last_name,
       salary,
       ROUND(salary * 1.155) AS "New Salary"
FROM employees;