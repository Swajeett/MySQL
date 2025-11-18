CREATE DATABASE MySQL_joins2;
USE MySQL_joins2;

CREATE TABLE Departments (
dept_id INT,
dept_name VARCHAR(50)
);

SELECT * FROM Departments;

CREATE TABLE Employees (
emp_id INT,
emp_name VARCHAR (50),
dept_id INT
);

SELECT * FROM Employees;

INSERT INTO Departments (dept_id, dept_name) VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Marketing');

INSERT INTO Employees (emp_id, emp_name, dept_id) VALUES
(101, 'Alice', 1),
(102, 'Bob', 2),
(103, 'Charlie', 2),
(104, 'David', 5),
(105, 'Eva', NULL);

# a) INNER JOIN 
# Employees with a matching department:

SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
INNER JOIN Departments d
ON e.dept_id = d.dept_id;

# b) LEFT JOIN 
# All employees, even of no department exists:

SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id;

# c) RIGHT JOIN 
# All deparments, even if no employee is assigned:

SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;

# d) FULL OUTER JOIN

SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
LEFT JOIN Departments d
ON e.dept_id = d.dept_id

UNION 

SELECT e.emp_id, e.emp_name, d.dept_name
FROM Employees e
RIGHT JOIN Departments d
ON e.dept_id = d.dept_id;
