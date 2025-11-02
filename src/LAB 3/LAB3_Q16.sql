-- LAB3 - Question 16
-- Display full name of employees whose last name does NOT contain 'A'
--
-- SOLUTION EXPLANATION:
-- Using NOT LIKE operator to exclude last names containing 'A'
-- Case-insensitive search using UPPER function
-- Concatenating first and last name for full name

SELECT first_name || ' ' || last_name AS "Full Name"
FROM employees
WHERE UPPER(last_name) NOT LIKE '%A%';