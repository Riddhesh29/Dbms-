-- =========================================
-- PRACTICAL 1
-- AIM:
-- Create a database using MySQL and
-- demonstrate all DDL and DML commands
-- =========================================

-- =========================================
-- DDL COMMANDS
-- =========================================

-- CREATE DATABASE
CREATE DATABASE CollegeDB;

-- USE DATABASE
USE CollegeDB;

-- CREATE TABLE
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    department VARCHAR(50),
    marks INT
);

-- DESCRIBE TABLE
DESC Students;

-- ALTER TABLE - ADD COLUMN
ALTER TABLE Students
ADD email VARCHAR(100);

-- ALTER TABLE - MODIFY COLUMN
ALTER TABLE Students
MODIFY department VARCHAR(100);

-- ALTER TABLE - RENAME COLUMN
ALTER TABLE Students
RENAME COLUMN marks TO total_marks;

-- ALTER TABLE - DROP COLUMN
ALTER TABLE Students
DROP COLUMN email;

-- RENAME TABLE
RENAME TABLE Students TO Student_Info;

-- =========================================
-- DML COMMANDS
-- =========================================

-- INSERT RECORDS
INSERT INTO Student_Info VALUES
(1, 'Rahul', 20, 'Computer Engineering', 85),
(2, 'Sneha', 21, 'Information Technology', 90),
(3, 'Amit', 22, 'Electronics', 78);

-- SELECT ALL RECORDS
SELECT * FROM Student_Info;

-- SELECT SPECIFIC COLUMNS
SELECT student_name, total_marks
FROM Student_Info;

-- UPDATE RECORD
UPDATE Student_Info
SET total_marks = 95
WHERE student_id = 2;

-- DISPLAY UPDATED RECORDS
SELECT * FROM Student_Info;

-- DELETE SPECIFIC RECORD
DELETE FROM Student_Info
WHERE student_id = 3;

-- DISPLAY AFTER DELETE
SELECT * FROM Student_Info;

-- =========================================
-- TCL COMMANDS
-- =========================================

-- START TRANSACTION
START TRANSACTION;

-- INSERT NEW RECORD
INSERT INTO Student_Info VALUES
(4, 'Pooja', 20, 'Mechanical', 88);

-- SAVEPOINT
SAVEPOINT sp1;

-- INSERT ANOTHER RECORD
INSERT INTO Student_Info VALUES
(5, 'Karan', 21, 'Civil', 76);

-- ROLLBACK TO SAVEPOINT
ROLLBACK TO sp1;

-- COMMIT CHANGES
COMMIT;

-- DISPLAY FINAL TABLE
SELECT * FROM Student_Info;

-- =========================================
-- DCL COMMANDS
-- =========================================

-- CREATE USER
CREATE USER 'student_user'@'localhost'
IDENTIFIED BY 'password123';

-- GRANT PERMISSION
GRANT SELECT, INSERT
ON CollegeDB.*
TO 'student_user'@'localhost';

-- REVOKE PERMISSION
REVOKE INSERT
ON CollegeDB.*
FROM 'student_user'@'localhost';

-- =========================================
-- DROP COMMANDS
-- =========================================

-- DROP TABLE
DROP TABLE Student_Info;

-- DROP DATABASE
DROP DATABASE CollegeDB;