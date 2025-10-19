-- LAB1 - A. Regions Table
-- Create and populate the regions table

CREATE TABLE regions (
    region_id NUMBER,
    region_name VARCHAR2(25),
    CONSTRAINT regions_pk PRIMARY KEY (region_id)
);

INSERT INTO regions(region_id, region_name) VALUES (1, 'Europe');
INSERT INTO regions VALUES (2, 'Americas');
INSERT INTO regions VALUES (3, 'Asia');
INSERT INTO regions VALUES (4, 'Middle East and Africa');

COMMIT;