CREATE DATABASE groupby_example;
USE groupby_example;

CREATE TABLE Sales (
    id INT,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO Sales (id, product, category, quantity, price) VALUES
(1, 'Laptop', 'Electronics', 2, 50000.00),
(2, 'Phone', 'Electronics', 5, 20000.00),
(3, 'Tablet', 'Electronics', 3, 15000.00),
(4, 'Shirt', 'Clothing', 10, 800.00),
(5, 'Jeans', 'Clothing', 6, 1200.00),
(6, 'Shoes', 'Clothing', 4, 2500.00),
(7, 'Milk', 'Grocery', 15, 50.00),
(8, 'Bread', 'Grocery', 8, 40.00),
(9, 'Butter', 'Grocery',5,150.00);

SELECT * FROM Sales;

# Total quantity sold by category
SELECT category, SUM(quantity) AS total_quantity
FROM Sales GROUP BY category;

# Average price by category
SELECT category, AVG(price) AS average_price 
FROM sales GROUP BY category;

# Count of products in each category
SELECT category, COUNT(product) AS Count_of_Product 
FROM sales GROUP BY category;

# highest priced item in each category
SELECT category, MAX(price) AS Highest_Price
FROM sales GROUP BY category;

CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR (50)
);

INSERT INTO Employees (emp_id, emp_name, department, salary, city) VALUES
(1, 'Amit', 'HR', 40000, 'Pune'),
(2, 'Neha', 'IT', 60000, 'Mumbai'),
(3, 'Raj', 'Finance', 55000, 'Delhi'),
(4, 'Sneha', 'IT', 65000, 'Pune'),
(5, 'Karan', 'HR', 42000, 'Delhi'),
(6, 'Meena', 'Finance', 58000, 'Mumbai'),
(7, 'Vikas', 'IT', 70000, 'Delhi'),
(8, 'Pooja', 'HR', 39000, 'Pune'),
(9, 'Arjun', 'Finance', 60000, 'Delhi'),
(10, 'Simran', 'IT', 72000,'Mumbai');

SELECT * FROM Employees;

# Average salary per department
SELECT department, AVG (salary) AS Average_salary 
FROM Employees GROUP BY department;

# Highest salary in each city
SELECT city, MAX(salary) AS Highest_salary
FROM Employees GROUP BY city;

# Number of employees in each department 
SELECT department, COUNT(emp_id) AS Number_of_employees
FROM Employees GROUP BY department;

# Total salary paid per department
SELECT department, SUM(salary) AS Total_Salary
FROM Employees GROUP BY department;



# HAVING EXAMPLE
# a) Departments with average salary above 55,000
SELECT department, AVG(salary) AS avg_salary 
FROM Employees GROUP BY department HAVING AVG(salary) > 55000;

# b) Cities where more than 2 employees work
SELECT city, COUNT(emp_id) AS total_employees
FROM Employees GROUP BY city
HAVING COUNT(emp_id) >2;

# c) Departments with total salary greater than 150000
SELECT department, SUM(salary) AS total_salary
FROM Employees GROUP BY department
HAVING SUM(salary) > 150000;

# d)