CREATE DATABASE SalesDB;
USE SalesDB;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    amount INT
);

-- Stored Procedure
DELIMITER //

CREATE PROCEDURE AddSale(
    IN s_id INT,
    IN p_name VARCHAR(100),
    IN amt INT
)
BEGIN
    INSERT INTO Sales VALUES(s_id, p_name, amt);
END //

DELIMITER ;

-- Execute Procedure
CALL AddSale(1, 'Laptop', 50000);
CALL AddSale(2, 'Mouse', 1000);

-- Function
DELIMITER //

CREATE FUNCTION TotalSales()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT SUM(amount)
    INTO total
    FROM Sales;

    RETURN total;
END //

DELIMITER ;

-- Execute Function
SELECT TotalSales();