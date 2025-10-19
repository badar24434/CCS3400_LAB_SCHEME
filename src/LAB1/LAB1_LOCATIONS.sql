-- LAB1 - C. Locations Table
-- Create and populate the locations table

CREATE TABLE locations (
    location_id NUMBER(4),
    street_address VARCHAR2(40),
    postal_code VARCHAR2(12),
    city VARCHAR2(30) NOT NULL,
    state_province VARCHAR2(25),
    country_id CHAR(2),
    CONSTRAINT locations_pk PRIMARY KEY (location_id),
    CONSTRAINT locations_fk FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

INSERT INTO locations VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO locations VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO locations VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO locations VALUES (1800, '460 Bloor St.W.', 'ON M5S 1X8', 'Toronto', 'Ontario', 'CA');
INSERT INTO locations VALUES (2500, 'Magdalen Centre, The Oxford Science Park', 'OX9 9ZB', 'Oxford', 'Oxford', 'UK');

COMMIT;