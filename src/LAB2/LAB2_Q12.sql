-- LAB2 - Question 12
-- Display annual compensation (salary * 12 + $300 bonus)
-- Show last name, salary, and annual compensation
--
-- SOLUTION EXPLANATION:
-- Calculating annual compensation by multiplying monthly salary by 12
-- Adding one-time bonus of $300 for each employee
-- Displaying last_name, current salary, and calculated annual compensation

SELECT last_name, 
       salary, 
       (salary * 12) + 300 AS annual_compensation
FROM employees;