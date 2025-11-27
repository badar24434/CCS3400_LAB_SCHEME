-- LAB7 Master Script
-- Execute all Lab 7 SQL JOIN exercises
--
-- LEARNING OUTCOME: Execute SQL DML commands with JOINs
-- Student Learning Time (SLT): 3 hours
--
-- NOTE: These queries require tables from LAB1 to exist
-- Make sure LAB1 tables are created before running these exercises

PROMPT 'LAB7 - SQL JOIN Operations Practice'
PROMPT '=================================='

PROMPT 'Question 1: Department addresses using NATURAL JOIN...'
@LAB7_Q1.sql

PROMPT 'Question 2: All employees with department information...'
@LAB7_Q2.sql

PROMPT 'Question 3: Employees working in Toronto...'
@LAB7_Q3.sql

PROMPT 'Question 4: Employees with their managers...'
@LAB7_Q4.sql

PROMPT 'Question 5: All employees including those without managers...'
@LAB7_Q5.sql

PROMPT 'Question 6: Employees with their colleagues...'
@LAB7_Q6.sql

PROMPT 'Question 7: Job grades and salary report...'
@LAB7_Q7.sql

PROMPT 'Question 8: Employees hired after Davies...'
@LAB7_Q8.sql

PROMPT 'Question 9: Employees hired before their managers...'
@LAB7_Q9.sql

PROMPT 'Question 10: Departments without ST_CLERK using set operators...'
@LAB7_Q10.sql

PROMPT 'Question 11: Employees who returned to original jobs...'
@LAB7_Q11.sql

PROMPT 'LAB7 Complete!'
PROMPT 'All SQL JOIN exercises have been executed.'