-- LAB1 - B. Countries Table
-- Create and populate the countries table

CREATE TABLE countries (
    country_id CHAR(2),
    country_name VARCHAR2(40),
    region_id NUMBER,
    CONSTRAINT countries_pk PRIMARY KEY (country_id),
    CONSTRAINT countries_fk FOREIGN KEY (region_id) REFERENCES regions (region_id)
);

INSERT INTO countries VALUES ('CA', 'Canada', 2);
INSERT INTO countries VALUES ('DE', 'Germany', 1);
INSERT INTO countries VALUES ('UK', 'United Kingdom', 1);
INSERT INTO countries VALUES ('US', 'United States of America', 2);

COMMIT;