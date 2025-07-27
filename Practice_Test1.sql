CREATE DATABASE Practice_Test1;
USE Practice_Test1;
CREATE TABLE Superstore(
OrderID INT,
OrderDate VARCHAR(255),
CustomerName VARCHAR(255),
ProductName VARCHAR(255),
Category VARCHAR(255),
SubCategory VARCHAR(255),
Sales INT,
Quantity INT,
Discount VARCHAR(255),
Profit INT,
Region VARCHAR(255)
);

SELECT * FROM Superstore;

INSERT INTO Superstore (OrderID, OrderDate, CustomerName, ProductName, Category, SubCategory, Sales, Quantity, Discount, Profit, Region) VALUES
(1001,"2023-01-15","Alice","Office Chair", "Furniture", "Chairs", 250, 2, "0.1", 40, "South"),
(1002,"2023-02-12","Bob","Monitor", "Technology", "Accessories", 300, 1, "0.05", 60, "East"),
(1003,"2023-03-18","Charlie","Bookcase", "Furniture", "Bookcases", 500, 3, "0.2", 70, "West"),
(1004,"2023-03-20","David","Paper Ream", "Office", "Paper", 30, 5, "0", 5, "Central"),
(1005,"2023-04-05","Eva","Stapler", "Office", "Supplies", 15, 2, "0.1", 2, "South"),
(1006,"2023-05-10","Alice","Laptop", "Technology", "Machines", 1200, 1, "0.15", 200, "East"),
(1007,"2023-06-01","Bob","Table", "Furniture", "Tables", 700, 2, "0.1", 80, "West"),
(1008,"2023-06-12","Charlie","Pen Pack", "Office", "Supplies", 20, 4, "0", 3, "Central"),
(1009,"2023-07-04","David","Headphones", "Technology", "Accessories", 150, 1, "0.2", 25, "South"),
(1010,"2023-07-15","Eva","Whiteboard", "Office", "Supplies", 90, 1, "0.05", 12, "East");


-- 1. RETRIEVE ALL COLUMNS FROM THE SUPERSTORE TABLE
SELECT * FROM Superstore;

-- 2. COUNT THE TOTAL NUMBER OF ORDERS 
SELECT COUNT(OrderID) FROM Superstore;

-- 3. LIST ALL ORDERS FROM THE REGION "SOUTH"
SELECT ProductName FROM Superstore WHERE Region = "SOUTH";

-- 4. CALCULATE THE TOTAL SALES AND TOTAL PROFIT
SELECT SUM(Sales),SUM(Profit) FROM Superstore;

-- 5. SHOW ALL UNIQUE PRODUCT CATEGORIES 
SELECT  Category FROM Superstore;
SELECT DISTINCT Category FROM Superstore;

-- 6. DISPLAY THE TOP 5 MOST PROFITABLE ORDERS
SELECT ProductName,Profit FROM Superstore WHERE Profit > 39;
SELECT * FROM Superstore ORDER BY Profit DESC LIMIT 5;

-- 7. FIND THE AVERAGE DISCOUNT APPLIED
SELECT AVG(Discount) FROM Superstore;

-- 8. SHOW TOTAL SALES GROUPED BY REGION 
SELECT SUM(Sales),Region FROM Superstore WHERE Region = "South";
SELECT SUM(Sales),Region FROM Superstore WHERE Region = "East";
SELECT SUM(Sales),Region FROM Superstore WHERE Region = "West";
SELECT SUM(Sales),Region FROM Superstore WHERE Region = "Central";
SELECT SUM(Sales),Region FROM Superstore GROUP BY Region;

-- 9. COUNT THE NUMBER OF ORDERS PLACED BY EACH CUSTOMER
SELECT COUNT(Sales) FROM Superstore;

-- 10. LIST ALL ORDERS WHERE THE DISCOUNT IS GREATER THAN 20%
SELECT ProductName FROM Superstore WHERE Discount > 0.2;

-- 11. RETRIEVE ORDERS WITH SALES BETWEEN 100 AND 500
SELECT ProductName FROM Superstore WHERE Sales BETWEEN 100 and 500;

-- 12. IDENTIFY THE SUB-CATEGORY WITH THE HIGHEST TOTAL PROFIT 
SELECT SubCategory FROM Superstore WHERE Profit = 200;

-- 13. INCREASE THE DISCOUNT BY 5% FOR ALL ORDERS IN THE "FURNITURE" CATEGORY
SELECT Discount+0.05 FROM Superstore WHERE Category = "Furniture"; 

-- 14. DELETE ALL ORDERS WHERE SALES ARE LESS THAN 10
DELETE (Sales < 10);

-- 15. SHOW THE MONTHLY SALES TREND BY GROUPING SALES PER MONTH



