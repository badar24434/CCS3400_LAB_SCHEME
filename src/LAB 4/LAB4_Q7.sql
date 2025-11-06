-- LAB4 - Question 7
-- Calculate months between today and hire date for each employee
-- Round up to closest whole number and sort by months employed
--
-- SOLUTION EXPLANATION:
-- MONTHS_BETWEEN function calculates months between two dates
-- CEIL function rounds up to nearest whole number
-- ORDER BY sorts from least to most months employed

SELECT last_name,
       CEIL(MONTHS_BETWEEN(SYSDATE, hire_date)) AS "MONTHS_WORKED"
FROM employees
ORDER BY MONTHS_BETWEEN(SYSDATE, hire_date);