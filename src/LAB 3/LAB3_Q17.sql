-- LAB3 - Question 17
-- Display employees who earn commission
-- Show last name, job, salary, and commission, sorted by salary (descending)
--
-- SOLUTION EXPLANATION:
-- Using IS NOT NULL to find employees with commission
-- ORDER BY salary DESC for descending order
-- Displaying all required columns

SELECT last_name, job_id, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;