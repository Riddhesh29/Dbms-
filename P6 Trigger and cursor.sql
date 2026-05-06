CREATE DATABASE EmployeeDB;
USE EmployeeDB;

-- Employee Table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary INT
);

-- Audit Table
CREATE TABLE EmployeeAudit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_performed VARCHAR(100),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger
DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeAudit(emp_id, action_performed)
    VALUES(NEW.emp_id, 'Employee Inserted');
END //

DELIMITER ;

-- Insert Data
INSERT INTO Employees VALUES
(1, 'Rahul', 50000),
(2, 'Sneha', 60000);

-- Cursor Example
DELIMITER //

CREATE PROCEDURE DisplayEmployees()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE e_name VARCHAR(100);

    DECLARE emp_cursor CURSOR FOR
    SELECT emp_name FROM Employees;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET done = TRUE;

    OPEN emp_cursor;

    read_loop: LOOP
        FETCH emp_cursor INTO e_name;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT e_name;
    END LOOP;

    CLOSE emp_cursor;
END //

DELIMITER ;

CALL DisplayEmployees();