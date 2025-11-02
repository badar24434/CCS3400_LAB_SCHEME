-- LAB3 - Question 13
-- Display employees who have both 'a' and 'e' in their last name
--
-- SOLUTION EXPLANATION:
-- Using two LIKE conditions with AND operator
-- Each LIKE checks for the presence of one letter
-- % wildcard allows the letters to be anywhere in the name

SELECT last_name
FROM employees
WHERE last_name LIKE '%a%'
AND last_name LIKE '%e%';