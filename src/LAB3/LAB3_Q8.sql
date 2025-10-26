-- LAB3 - Question 8
-- Display employees whose salary starts with 170
-- Show full name, job title, and salary
--
-- SOLUTION EXPLANATION:
-- Using LIKE operator with wildcard (%) to find salaries starting with '170'
-- Converting salary to string for pattern matching
-- Joining with jobs table to get job title

SELECT e.first_name || ' ' || e.last_name AS "Full Name",
       j.job_title,
       e.salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND TO_CHAR(e.salary) LIKE '170%';