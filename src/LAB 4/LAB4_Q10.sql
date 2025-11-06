-- LAB4 - Question 10
-- Display first 8 characters of last name and salary represented as asterisks
-- Each asterisk = $1000, sort by salary descending
--
-- SOLUTION EXPLANATION:
-- SUBSTR gets first 8 characters of last name
-- RPAD creates asterisks: salary/1000 determines number of asterisks
-- Concatenation combines name and asterisk representation
-- ORDER BY DESC sorts highest salary first

SELECT SUBSTR(last_name, 1, 8) || ' ' || 
       RPAD('', salary/1000, '*') AS "EMPLOYEES_AND_THEIR_SALARIES"
FROM employees
ORDER BY salary DESC;