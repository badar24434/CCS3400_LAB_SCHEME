-- LAB3 - Question 18
-- Display employees whose commission is exactly 20% (0.2)
-- Show last name, salary, and commission
--
-- SOLUTION EXPLANATION:
-- Using equality operator (=) to find commission_pct = 0.2 (which is 20%)
-- Commission is stored as decimal (0.2 = 20%)

SELECT last_name, salary, commission_pct
FROM employees
WHERE commission_pct = 0.2;