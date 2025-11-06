-- LAB4 - Question 9
-- Display last name and commission, showing 0 for NULL commission
--
-- SOLUTION EXPLANATION:
-- NVL function replaces NULL values with 0
-- This ensures all employees show a commission value
-- Employees without commission will display 0 instead of NULL

SELECT last_name,
       NVL(commission_pct, 0) AS "COMM"
FROM employees;