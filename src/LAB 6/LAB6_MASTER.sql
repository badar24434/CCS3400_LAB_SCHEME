-- LAB6 Master Script
-- Execute all Lab 6 SQL subquery exercises
--
-- LEARNING OUTCOME: Execute SQL DML commands with subqueries
-- Student Learning Time (SLT): 3 hours
--
-- NOTE: These queries require tables from LAB1 to exist
-- Make sure LAB1 tables are created before running these exercises

PROMPT 'LAB6 - SQL Subqueries Practice'
PROMPT '=============================='

PROMPT 'Question 1: Sales department employees...'
@LAB6_Q1.sql

PROMPT 'Question 2: Non-sales employees earning more than min Sales Manager salary...'
@LAB6_Q2.sql

PROMPT 'Question 3: Employees earning above average salary...'
@LAB6_Q3.sql

PROMPT 'Question 4: Employees with same position as Grant...'
@LAB6_Q4.sql

PROMPT 'Question 5: Employees working in location 1700...'
@LAB6_Q5.sql

PROMPT 'Question 6: Employees reporting to King...'
@LAB6_Q6.sql

PROMPT 'Question 7: Sales department employee details...'
@LAB6_Q7.sql

PROMPT 'Question 8: Non-IT employees earning less than all IT programmers...'
@LAB6_Q8.sql

PROMPT 'LAB6 Complete!'
PROMPT 'All SQL subquery exercises have been executed.'