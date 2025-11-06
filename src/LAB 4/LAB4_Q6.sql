-- LAB4 - Question 6
-- Display last name (proper case) and length for names starting with J, A, or M
-- Sort by last name
--
-- SOLUTION EXPLANATION:
-- INITCAP function capitalizes first letter and lowercases the rest
-- LENGTH function gets string length
-- WHERE with LIKE and OR for multiple starting letters
-- ORDER BY sorts results alphabetically

SELECT INITCAP(last_name) AS "Last Name",
       LENGTH(last_name) AS "Length"
FROM employees
WHERE last_name LIKE 'J%'
   OR last_name LIKE 'A%'
   OR last_name LIKE 'M%'
ORDER BY last_name;

