CREATE DATABASE In_between_example;
USE In_between_example;

CREATE TABLE Supermart (
ItemName VARCHAR(50),
Category VARCHAR(30),
Brand VARCHAR (30),
City VARCHAR (30)
);

INSERT INTO Supermart (ItemName, Category, Brand, City) VALUES
('Apple Juice', 'Beverages', 'Tropicana', 'New York'),
('Banana Chips', 'Snacks', 'Lay\'s', 'London'),
('Orange Soda', 'Beverages', 'Pepsi', 'Paris'),
('Milk Chocolate', 'Snacks', 'Cadbury', 'New Delhi'),
('Eggs Pack', 'Dairy', 'Amul', 'Berlin'),
('Ice Cream', 'Dairy', 'Mother Dairy', 'Mumbai'),
('Oreo Biscuits', 'Snacks', 'Oreo', 'London'),
('Ultra Milk', 'Dairy', 'Nestle', 'Paris'),
('Udon Noodles', 'Grocery', 'Nissin', 'Tokyo'),
('Almond Butter', 'Grocery', 'Nutella', 'New York');

SELECT * FROM Supermart;

-- Items from London or Paris
SELECT * FROM Supermart
WHERE City IN ('London', 'Paris');

-- Items from Snacks or Dairy Category
SELECT * FROM Supermart 
WHERE Category IN ('Snacks', 'Dairy');

-- Brands from pepsi, oreo, or amul
SELECT * FROM Supermart
WHERE Brand IN ('Pepsi', 'Oreo', 'Amul');

ALTER TABLE Supermart ADD Price DECIMAL (6,2);

UPDATE Supermart
SET Price = CASE ItemName
WHEN 'Apple Juice' THEN 3.50
WHEN 'Banana Chips' THEN 2.00
WHEN 'Orange Soda' THEN 1.75
WHEN 'Milk Chocolate' THEN 4.00
WHEN 'Eggs Pack' THEN 2.50
WHEN 'Ice Cream' THEN 5.00
WHEN 'Oreo Biscuits' THEN 2.25
WHEN 'Ultra Milk' THEN 3.00
WHEN 'Udon Noodles' THEN 6.00
WHEN 'Almond Butter' THEN 7.50
END;

-- Items priced between 2 and 5 
SELECT * FROM Supermart
WHERE Price BETWEEN 2 AND 5;

-- Items NOT between 2 and 5 
SELECT * FROM Supermart 
WHERE Price NOT BETWEEN 2 AND 5;

-- Items names alphabetically between 'A' and 'M'
SELECT * FROM Supermart
WHERE ItemName BETWEEN 'A' AND 'M';