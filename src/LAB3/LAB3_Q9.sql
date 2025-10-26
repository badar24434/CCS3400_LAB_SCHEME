-- LAB3 - Question 9
-- Display employees hired in 1994
-- Show last name and hire date
--
-- SOLUTION EXPLANATION:
-- Using LIKE operator to match year '94' in hire_date
-- Oracle date format typically shows 2-digit year, so matching '%94'
-- Alternative: Use TO_CHAR to extract year

SELECT last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'YYYY') = '1994';

-- Alternative approach:
-- WHERE hire_date LIKE '%94';