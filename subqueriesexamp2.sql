CREATE DATABASE subqueries_exapmle2;
USE subqueries_exapmle2;

CREATE TABLE superstore (
order_id VARCHAR (20),
order_date DATE,
customer_name VARCHAR(100),
region VARCHAR (50),
category VARCHAR(50),
sub_category VARCHAR (50),
product_name VARCHAR (100),
sales DECIMAL(10,2),
quantity INT,
discount DECIMAL(5,2),
profit DECIMAL (10,2)
);

SELECT * FROM superstore;

INSERT INTO superstore 
(order_id, order_date, customer_name, region, category, sub_category, product_name, sales, quantity, discount, profit) 
VALUES
('ORD001', '2025-01-10', 'Amit Sharma', 'West', 'Furniture', 'Chairs', 'Office Chair', 250.00, 2, 0.10, 40.00),
('ORD002', '2025-01-12', 'Sneha Patil', 'East', 'Technology', 'Phones', 'iPhone 15', 1200.00, 1, 0.00, 200.00),
('ORD003', '2025-01-15', 'Ravi Kumar', 'South', 'Office Supplies', 'Binders', 'Binder Pack', 50.00, 5, 0.20, 10.00),
('ORD004', '2025-01-18', 'Meena Joshi', 'West', 'Technology', 'Laptops', 'Dell Laptop', 900.00, 1, 0.05, 150.00),
('ORD005', '2025-01-20', 'Anil Singh', 'North', 'Furniture', 'Tables', 'Study Table', 450.00, 1, 0.15, 70.00),
('ORD006', '2025-01-22', 'Priya Desai', 'East', 'Office Supplies', 'Paper', 'A4 Paper', 30.00, 3, 0.00, 5.00),
('ORD007', '2025-01-25', 'Vikas Gupta', 'South', 'Furniture', 'Chairs', 'Recliner Chair', 600.00, 2, 0.10, 90.00);

# Find orders with sales above average 
SELECT order_id, customer_name, sales FROM superstore WHERE sales > (SELECT AVG(sales) FROM superstore);

# MIN and MAX of sales
SELECT MAX(sales), MIN(sales) from superstore ;

# Customers who bought Technology products
SELECT customer_name FROM superstore
WHERE category IN (SELECT DISTINCT category FROM superstore WHERE category ='Technology');