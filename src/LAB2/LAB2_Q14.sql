-- LAB2 - Question 14
-- Display last name concatenated with job ID (separated by comma and space)
-- Name the column "Employee and Title"
--
-- SOLUTION EXPLANATION:
-- Using concatenation operator (||) to combine last_name with job_id
-- Adding comma and space as separator between the two values
-- Using column alias "Employee and Title" for the result

SELECT last_name || ', ' || job_id AS "Employee and Title"
FROM employees;