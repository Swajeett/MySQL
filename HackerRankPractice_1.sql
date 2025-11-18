CREATE DATABASE HackerRankPractice_1;
USE HackerRankPractice_1;

CREATE TABLE Categories(
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR (50)
);

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR (100),
CategoryID INT,
UnitPrice DECIMAL (10,2),
FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
);
SELECT * FROM Categories;
SELECT * FROM Products;

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100),
City VARCHAR (50),
Region VARCHAR(50)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
Region VARCHAR(50),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
SELECT * FROM Customers;
SELECT * FROM Orders;

CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
Discount DECIMAL(5,2),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
SELECT * FROM OrderDetails;

INSERT INTO Categories VALUES 
(1,'Furniture'), (2,'Office Supplies'), (3,'Technology');

INSERT INTO Products VALUES 
(101,'Office Chair',1,2500),
(102,'Desk',1,5000),
(103,'Pen',2,20),
(104,'Notebook',2,50),
(105, 'Laptop', 3, 60000),
(106, 'Headphones', 3, 3000);

INSERT INTO Customers VALUES
(1, 'Ravi Sharma', 'Delhi', 'North'),
(2, 'Sneha Patil', 'Mumbai', 'West'),
(3, 'Amit Verma', 'Kolkata', 'East'),
(4, 'Priya Rao', 'Bangalore', 'South');

INSERT INTO Orders VALUES 
(1001,1,'2024-04-10','North'),
(1002,2,'2024-04-11','West'),
(1003,3,'2024-04-12','East'),
(1004,4,'2024-04-13','South'),
(1005,1,'2024-04-14','North');

INSERT INTO OrderDetails VALUES
(1,1001,101,2,0.05),
(2,1001,103,10,0),
(3,1002,105,1,0.1),
(4,1003,104,5,0),
(5,1004,106,2,0.2),
(6,1005,102,1,0);

# Beginner Level
-- Show all customers and their cities.
SELECT CustomerName, City FROM Customers;

-- List all product names and their prices.
SELECT ProductName, UnitPrice FROM Products;

-- Display all orders placed in April 2024. ------------------
SELECT * FROM Orders 
WHERE MONTH(OrderDate) = 4 AND YEAR(OrderDate) = 2024;

-- Count total number of customers.
SELECT COUNT(*) AS Total_Customers FROM Customers;

-- Find all unique regions in the Customers table.
SELECT DISTINCT Region FROM Customers;

-- Show products priced above ₹1000.
SELECT * FROM Products WHERE UnitPrice > 1000;

-- Display all products with their category names.
SELECT p.ProductName, p.CategoryID, c.CategoryName FROM Products p 
INNER JOIN Categories c 
ON c.CategoryID = p.CategoryID;

# Intermidiate Level
-- Show customer name, order ID, and order date.
SELECT c.CustomerName, o.OrderID, o.OrderDate FROM Customers c 
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Display all products purchased by Ravi Sharma. --------------
SELECT p.ProductName FROM Customers c 
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE c.CustomerName = 'Ravi Sharma';

-- Find total quantity of products sold in each order.
SELECT o.OrderID, SUM(od.Quantity) AS TotalQuantity
FROM Orders o 
JOIN OrderDetails od ON o.OrderID = od.OrderID 
GROUP BY o.OrderID;

-- Calculate revenue for each order (Quantity × UnitPrice × (1-Discount)).
SELECT o.OrderID,
ROUND(SUM(od.Quantity * p.UnitPrice * (1 - od.Discount)), 2) AS Revenue
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID;

-- List categories and count of products in each.
SELECT c.CategoryName, COUNT(p.ProductId) FROM Categories c 
INNER JOIN Products p 
ON c.CategoryID = p.CategoryId
GROUP BY c.CategoryName;

-- Find customers who placed more than one order.
SELECT c.CustomerName, COUNT(o.OrderID) AS OrderCount
FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
HAVING COUNT(o.OrderID) > 1;

-- Show total sales amount for each region.
SELECT o.Region,
ROUND(SUM(od.Quantity * p.UnitPrice * (1 - od.Discount)),2) AS TotalSales
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.Region;

-- Find the most expensive product in each category.
SELECT c.CategoryName, p.ProductName, p.UnitPrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice = (
	SELECT MAX(p2.UnitPrice)
	FROM Products p2
    WHERE p2.CategoryID = p.CategoryID
    );
    
-- Display top 3 products by total revenue.
SELECT p.ProductName,
ROUND(SUM(od.Quantity * p.UnitPrice * (1 - od.Discount)), 2) AS Revenue
FROM OrderDetails od 
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Revenue DESC
LIMIT 3;

-- Find all orders containing products from more than one category.
SELECT o.OrderID FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY o.OrderID
HAVING COUNT(DISTINCT p.CategoryID) > 1;