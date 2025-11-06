-- LAB4 - Question 2
-- Display the current date with label "Date"
--
-- SOLUTION EXPLANATION:
-- Using SYSDATE function to get current system date
-- Column alias provides descriptive label

SELECT SYSDATE AS "Date"
FROM DUAL;