CREATE DATABASE CourseManagement;
USE CourseManagement;

-- Create Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100),
    fees INT
);

-- Insert Data
INSERT INTO Courses VALUES
(101, 'DBMS', 'Mr. Sharma', 5000),
(102, 'Python', 'Mrs. Patil', 4500),
(103, 'Java', 'Mr. Rao', 6000);

-- Create View
CREATE VIEW CourseView AS
SELECT course_name, instructor
FROM Courses;

-- Display View
SELECT * FROM CourseView;

-- Create Index
CREATE INDEX idx_course_name
ON Courses(course_name);

-- Query using indexed column
SELECT * FROM Courses
WHERE course_name = 'Python';