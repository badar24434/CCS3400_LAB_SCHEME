-- LAB1 - H. Job Grades Table
-- Create and populate the job_grades table
-- Note: This table is not included in the HR ERD

CREATE TABLE job_grades (
    grade_level VARCHAR2(3),
    lowest_sal NUMBER,
    highest_sal NUMBER
);

INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);

COMMIT;