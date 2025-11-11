-- LAB5 - Question 1
-- Count departments with unique names
--
-- SOLUTION EXPLANATION:
-- Using COUNT with DISTINCT to count unique department names
-- This eliminates any duplicate department names from the count
-- Shows total number of departments with different names

SELECT COUNT(DISTINCT department_name) AS "Number of Unique Departments"
FROM departments;