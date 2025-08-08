CREATE DATABASE SQL_Analysis_example1;

USE SQL_Analysis_example1;

CREATE TABLE Orders(
OrderID VARCHAR(10),
OrderDate DATE,
ShipDate DATE,
CustomerID VARCHAR(10),
Segment VARCHAR (20),
Region VARCHAR (20),
Sales DECIMAL (10,2),
Quantity INT,
Discount DECIMAL(4,2),
Profit DECIMAL (10,2)
);
DROP TABLE Orders;
SELECT * FROM Orders;

CREATE TABLE Customers (
CustomerID VARCHAR (10),
CustomerName VARCHAR (100),
Country VARCHAR (50)
);
DROP TABLE Customers;
SELECT * FROM Customers;

CREATE TABLE Products (
ProductID VARCHAR (10),
Category VARCHAR (50),
SubCategory VARCHAR(50),
ProductName VARCHAR (100)
);
DROP TABLE Products;
SELECT * FROM Products;

INSERT INTO Orders VALUES
('O1001', '2023-01-05', '2023-01-10', 'C001', 'Consumer', 'East', 500.00, 5, 0.10, 50.00),
('O1002', '2023-01-07', '2023-01-12', 'C002', 'Corporate', 'West', 300.00, 3, 0.00, 45.00),
('O1003', '2023-01-10', '2023-01-15', 'C001', 'Consumer', 'East', 200.00, 2, 0.05, 20.00),
('O1004', '2023-02-01', '2023-02-05', 'C003', 'Home Office', 'Central', 800.00, 8, 0.20, 60.00),
('O1005', '2023-02-10', '2023-02-14', 'C004', 'Consumer', 'South', 450.00, 4, 0.15, -20.00);

INSERT INTO Customers VALUES
('C001', 'Alice Johnson', 'USA'),
('C002', 'Bob Smith', 'USA'),
('C003', 'Carol White', 'USA'),
('C004', 'David Brown', 'USA');

INSERT INTO Products VALUES
('P001', 'Furniture', 'Chairs', 'Office Chair'),
('P002', 'Technology', 'Phones', 'Smartphone'),
('P003', 'Office Supplies', 'Paper', 'A4 Paper'),
('P004', 'Furniture', 'Tables', 'Wooden Table'),
('P005', 'Technology', 'Accessories', 'Wireless Mouse');

# Q1. List all orders with sales greater than 400.
SELECT * FROM Orders WHERE Sales > 400;

# Q2. Calculate the total profit for each region.
SELECT SUM(Profit), Region FROM Orders GROUP BY Region;

# Q3. Find the customer who made the highest total sales.
SELECT * FROM Orders ORDER BY Sales DESC LIMIT 1;

# Q4. Get average discount and quantity sold for each segment.
SELECT AVG(Discount), AVG(Quantity) FROM Orders GROUP BY Segment;

# Q5. List customers who ordered more than once. ----------


# Q6. Show total sales and average profit per month. -----

# Q7. Find the total number of orders per segment.
SELECT COUNT(OrderID),Segment FROM Orders GROUP BY Segment;

# Q8. Display region-wise profit where total profit is greater than 50.
SELECT SUM(Profit), Region FROM Orders WHERE Profit > 50 GROUP BY Region;

# Q9. Find the total sales and total profit for the entire dataset.
SELECT SUM(Sales), SUM(Profit) FROM Orders;

# Q10. Get the number of distinct customers in each region.
SELECT DISTINCT COUNT(CustomerID), Region FROM Orders GROUP BY Region;