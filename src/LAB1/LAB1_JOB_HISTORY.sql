-- LAB1 - G. Job History Table
-- Create and populate the job_history table

CREATE TABLE job_history (
    employee_id NUMBER(6),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    job_id VARCHAR2(10) NOT NULL,
    department_id NUMBER(4),
    CONSTRAINT job_history_pk PRIMARY KEY (employee_id, start_date)
);

INSERT INTO job_history VALUES (102, '13-JAN-93', '24-JUL-98', 'IT_PROG', 60);
INSERT INTO job_history VALUES (101, '21-SEP-89', '27-OCT-93', 'AC_ACCOUNT', 110);
INSERT INTO job_history VALUES (101, '28-OCT-93', '15-MAR-97', 'AC_MGR', 110);
INSERT INTO job_history VALUES (201, '17-FEB-96', '19-DEC-99', 'MK_REP', 20);
INSERT INTO job_history VALUES (114, '24-MAR-98', '31-DEC-99', 'ST_CLERK', 50);
INSERT INTO job_history VALUES (122, '01-JAN-99', '31-DEC-99', 'ST_CLERK', 50);
INSERT INTO job_history VALUES (200, '17-SEP-87', '17-JUN-93', 'AD_ASST', 90);
INSERT INTO job_history VALUES (176, '24-MAR-98', '31-DEC-98', 'SA_REP', 80);
INSERT INTO job_history VALUES (176, '01-JAN-99', '31-DEC-99', 'SA_MAN', 80);
INSERT INTO job_history VALUES (200, '01-JUL-94', '31-DEC-96', 'AC_ACCOUNT', 90);

COMMIT;