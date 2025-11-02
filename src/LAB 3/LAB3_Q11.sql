-- LAB3 - Question 11
-- Display employees who earn commissions
-- Show last name, salary, and commission, sorted by salary and commission (descending)
--
-- SOLUTION EXPLANATION:
-- Using IS NOT NULL to find employees with commission
-- ORDER BY with DESC for descending order
-- Sorting by both salary and commission_pct

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;