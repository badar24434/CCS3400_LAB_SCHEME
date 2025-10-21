-- LAB2 - Question 5
-- Delete customer with ID = 2
--
-- SOLUTION EXPLANATION:
-- Using DELETE statement to remove the customer record with ID 2
-- WHERE clause ensures only the specific customer is deleted

DELETE FROM CUSTOMERS 
WHERE ID = 2;

-- Verify the deletion
SELECT * FROM CUSTOMERS;

COMMIT;