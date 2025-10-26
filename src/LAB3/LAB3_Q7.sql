-- LAB3 - Question 7
-- Display employees earning between $5000-$12000 in departments 20 or 50
-- Show last name and salary with column labels
--
-- SOLUTION EXPLANATION:
-- Using BETWEEN for salary range and IN for department filter
-- AND operator combines both conditions
-- Column aliases provide descriptive labels

SELECT last_name AS "Employee", 
       salary AS "Monthly Salary"
FROM employees
WHERE salary BETWEEN 5000 AND 12000
AND department_id IN (20, 50);