-- LAB7 - Question 1
-- Display addresses of all departments using NATURAL JOIN
-- Show location ID, street address, city, state/province, and country
--
-- SOLUTION EXPLANATION:
-- Using NATURAL JOIN between locations and countries tables
-- NATURAL JOIN automatically joins on common column names (country_id)
-- Selecting required address components for complete department addresses

SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;