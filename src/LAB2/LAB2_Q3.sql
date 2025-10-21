-- LAB2 - Question 3
-- Insert 3 records into CUSTOMERS table
--
-- SOLUTION EXPLANATION:
-- Inserting the specified customer records with all required data
-- Note: Must run Q2 first to create the CUSTOMERS table

INSERT INTO CUSTOMERS (ID, Name, Age, Address, Salary) 
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00);

INSERT INTO CUSTOMERS (ID, Name, Age, Address, Salary) 
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00);

INSERT INTO CUSTOMERS (ID, Name, Age, Address, Salary) 
VALUES (3, 'kaushik', 23, 'Kota', 2000.00);

-- Verify the inserted data
SELECT * FROM CUSTOMERS;

COMMIT;