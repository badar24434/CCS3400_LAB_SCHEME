-- LAB3 - Question 5
-- Display employees with last names Matos and Taylor
-- Show last name, job ID, and start date, ordered by start date
--
-- SOLUTION EXPLANATION:
-- Using IN operator to filter for multiple last names (Matos, Taylor)
-- hire_date represents the start date
-- ORDER BY clause sorts results in ascending order by hire_date

SELECT last_name, job_id, hire_date AS "Start Date"
FROM employees
WHERE last_name IN ('Matos', 'Taylor')
ORDER BY hire_date;