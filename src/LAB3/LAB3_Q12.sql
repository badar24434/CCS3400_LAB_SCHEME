-- LAB3 - Question 12
-- Display employees whose last name has 'a' as the third letter
--
-- SOLUTION EXPLANATION:
-- Using LIKE operator with underscore (_) wildcards
-- Two underscores represent any two characters, followed by 'a'
-- % represents any number of characters after 'a'

SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';