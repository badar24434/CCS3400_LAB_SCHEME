 -- LAB2 - Question 1
-- Identify 4 coding errors in the given SELECT statement
-- 
-- SOLUTION EXPLANATION:
-- The original statement has the following errors:
-- 1. Missing comma after 'last_name'
-- 2. Missing 'AS' keyword for alias or proper alias syntax
-- 3. Missing comma before 'ANNUAL SALARY' 
-- 4. Space in alias name 'ANNUAL SALARY' should be quoted or use underscore
--
-- Original (INCORRECT) statement:
-- SELECT employee_id, last_name
-- sal x 12 ANNUAL SALARY
-- FROM employees;

-- CORRECTED statement:
SELECT employee_id, last_name, 
       sal * 12 AS "ANNUAL SALARY"
FROM employees;

-- Alternative correct versions:
-- SELECT employee_id, last_name, sal * 12 AS ANNUAL_SALARY FROM employees;
-- SELECT employee_id, last_name, sal * 12 "ANNUAL SALARY" FROM employees;