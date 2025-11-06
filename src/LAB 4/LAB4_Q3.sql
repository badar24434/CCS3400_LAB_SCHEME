-- LAB4 - Question 3
-- Display last name and weeks employed for department 60 employees
-- Round weeks to nearest whole number
--
-- SOLUTION EXPLANATION:
-- Using date arithmetic (SYSDATE - hire_date) to calculate days
-- Dividing by 7 to convert days to weeks
-- ROUND function rounds to nearest whole number
-- WHERE clause filters for department 60

SELECT last_name,
       ROUND((SYSDATE - hire_date) / 7) AS "Weeks Employed"
FROM employees
WHERE department_id = 60;