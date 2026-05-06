CREATE DATABASE StudentCourseDB;
USE StudentCourseDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    marks INT
);

INSERT INTO Students VALUES
(1, 'Aman', 20, 75),
(2, 'Riya', 22, 90),
(3, 'Karan', 21, 65),
(4, 'Pooja', 23, 88);

-- WHERE Filter
SELECT * FROM Students
WHERE marks > 70;

-- Sorting
SELECT * FROM Students
ORDER BY marks DESC;

-- Nested Subquery
SELECT name, marks
FROM Students
WHERE marks > (
    SELECT AVG(marks)
    FROM Students
);