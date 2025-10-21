-- LAB2 - Question 4
-- Update ADDRESS for customer with ID = 3 to 'Pune'
--
-- SOLUTION EXPLANATION:
-- Using UPDATE statement to modify the address of customer with ID 3
-- WHERE clause ensures only the specific customer is updated

UPDATE CUSTOMERS 
SET Address = 'Pune' 
WHERE ID = 3;

-- Verify the update
SELECT * FROM CUSTOMERS WHERE ID = 3;

COMMIT;