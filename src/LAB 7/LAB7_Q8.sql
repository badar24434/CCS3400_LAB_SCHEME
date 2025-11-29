-- LAB7 - Question 8
-- Display employees hired after Davies
-- Show name and hire date
--
-- SOLUTION EXPLANATION:
-- Using subquery to find Davies' hire date
-- Main query finds employees hired after that date
-- Combining with self-join approach for comparison

SELECT e.first_name || ' ' || e.last_name AS "Name",
       e.hire_date
FROM employees e
WHERE e.hire_date > (SELECT hire_date 
                     FROM employees 
                     WHERE last_name = 'Davies')
ORDER BY e.hire_date;