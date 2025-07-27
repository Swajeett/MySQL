CREATE DATABASE MinMax;

USE MinMax;

CREATE TABLE products (
id INT,
name VARCHAR (50),
category VARCHAR (50),
price DECIMAL (10,2),
quantity INT
);

SELECT * FROM products;
DROP TABLE products;
INSERT INTO products (id, name, category, price, quantity) VALUES
(1, 'Laptop', 'Electronics', 60000, 10),
(2, 'Smartphone', 'Electronics', 30000, 25),
(3, 'Chair', 'Furniture', 2500, 50),
(4, 'Table', 'Furniture', 4000, 20),
(5, 'Pen', 'Stationary', 20, 200),
(6, 'Notebook', 'Stationary', 50, 150),
(7, 'Monitor', 'Electronics', 12000, 15),
(8, 'Bottle', 'Kitchen', 150, 100),
(9, 'Fridge', 'Electronics',35000, 8),
(10, 'Sofa', 'Furniture', 20000, 5);


SELECT MIN(price) AS MinPrice FROM products;

SELECT MAX(quantity) AS MaxQuantity FROM products;

SELECT COUNT(*) AS TotalItems FROM Products;

SELECT AVG(price) AS AvgPrice FROM Products;

SELECT SUM(quantity) AS TotalStock FROM Products;

SELECT * FROM products LIMIT 5;

SELECT * FROM Products WHERE category = 'Furniture';

SELECT * FROM products ORDER BY price DESC;

UPDATE products SET price = price + 500 WHERE category = 'Furniture';

DELETE FROM products WHERE name = 'pen';

SELECT * FROM products WHERE price BETWEEN 1000 and 10000;
