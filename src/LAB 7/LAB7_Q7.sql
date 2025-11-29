-- LAB7 - Question 7
-- Display JOB_GRADES table structure and employee grades report
-- Show name, job, department name, salary and grade
--
-- SOLUTION EXPLANATION:
-- First showing structure of JOB_GRADES table for reference
-- Then joining employees with departments and job_grades tables
-- Using BETWEEN to match salary with grade ranges

-- Show structure of JOB_GRADES table
DESC job_grades;

-- Main query: Employee grades report
SELECT e.first_name || ' ' || e.last_name AS "Name",
       e.job_id AS "Job",
       d.department_name AS "Department",
       e.salary AS "Salary",
       jg.grade_level AS "Grade"
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
JOIN job_grades jg ON e.salary BETWEEN jg.lowest_sal AND jg.highest_sal
ORDER BY e.salary DESC;