-- LAB1 - D. Departments Table
-- Create and populate the departments table
-- Note: Fixed the constraint syntax error in original code

CREATE TABLE departments (
    department_id NUMBER(4),
    department_name VARCHAR2(30) NOT NULL,
    manager_id NUMBER(6),
    location_id NUMBER(4),
    CONSTRAINT departments_pk PRIMARY KEY (department_id),
    CONSTRAINT dept_fk1 FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

INSERT INTO departments VALUES (10, 'Administration', 200, 1700);
INSERT INTO departments VALUES (20, 'Marketing', 201, 1800);
INSERT INTO departments VALUES (50, 'Shipping', 124, 1500);
INSERT INTO departments VALUES (60, 'IT', 103, 1400);
INSERT INTO departments VALUES (80, 'Sales', 149, 2500);
INSERT INTO departments VALUES (90, 'Executive', 100, 1700);
INSERT INTO departments VALUES (110, 'Accounting', 205, 1700);
INSERT INTO departments VALUES (190, 'Contracting', NULL, 1700);

COMMIT;