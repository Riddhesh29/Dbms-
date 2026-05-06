CREATE DATABASE OrderManagement;
USE OrderManagement;

-- Customer Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100)
);

-- Insert Data
INSERT INTO Customers VALUES
(1, 'Rahul'),
(2, 'Sneha'),
(3, 'Amit');

INSERT INTO Orders VALUES
(101, 1, 'Laptop'),
(102, 1, 'Mouse'),
(103, 2, 'Keyboard');

-- INNER JOIN
SELECT Customers.customer_name, Orders.product_name
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- LEFT JOIN
SELECT Customers.customer_name, Orders.product_name
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- RIGHT JOIN
SELECT Customers.customer_name, Orders.product_name
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;

-- FULL OUTER JOIN (MySQL workaround)
SELECT Customers.customer_name, Orders.product_name
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id

UNION

SELECT Customers.customer_name, Orders.product_name
FROM Customers
RIGHT JOIN Orders
ON Customers.customer_id = Orders.customer_id;