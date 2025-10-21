-- LAB2 - Question 2
-- Create CUSTOMERS table with specified constraints
--
-- SOLUTION EXPLANATION:
-- Creating a CUSTOMERS table with:
-- - ID as primary key (NUMBER, NOT NULL)
-- - Name as VARCHAR2 (NOT NULL)
-- - Age as NUMBER (NOT NULL)
-- - Address as CHAR (can be NULL)
-- - Salary as NUMBER (can be NULL)

CREATE TABLE CUSTOMERS (
    ID NUMBER PRIMARY KEY NOT NULL,
    Name VARCHAR2(50) NOT NULL,
    Age NUMBER NOT NULL,
    Address CHAR(100),
    Salary NUMBER(10,2)
);

-- Verify table structure
DESC CUSTOMERS;