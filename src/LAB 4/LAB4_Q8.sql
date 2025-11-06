-- LAB4 - Question 8
-- Format salary to 15 characters, left-padded with $ symbol
--
-- SOLUTION EXPLANATION:
-- LPAD function pads salary to 15 characters with $ on the left
-- Converting salary to string first for padding
-- This creates uniform width display with $ symbols

SELECT last_name,
       LPAD(salary, 15, '$') AS "SALARY"
FROM employees;