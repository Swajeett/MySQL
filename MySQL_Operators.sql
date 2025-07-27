CREATE DATABASE MySQL_Operators;

USE MySQL_Operators;

CREATE TABLE employees (
emp_id INT,
name VARCHAR(255),
age INT,
salary DECIMAL (10,2),
department VARCHAR(255)
);

SELECT * FROM employees;

INSERT INTO employees (emp_id, name, age, salary, department) VALUES
(1, "Alice", 30, 60000, "HR"),
(2, "Bob", 25,50000, "IT"),
(3, "Charlie", 35, 70000, "Finance"),
(4, "David", 28, 45000, "IT"),
(5, "Eva", 40, 80000, "HR");



-- Arithmetic Operations 
-- Add 5000 bonus to each salary
SELECT name, salary, salary + 5000 AS new_salary FROM employees;

-- Subtract
SELECT name, salary, salary - 3000 AS new_salary FROM employees;

-- Multiply
SELECT name, salary, salary * 2 AS new_salary FROM employees;

-- Division 
SELECT name, salary, salary / 5 AS new_salary FROM employees;


-- Comparison Operators
-- Employees earning greater than 55000
SELECT * FROM employees WHERE salary > 55000;

-- Employees earning less than 55000
SELECT * FROM employees WHERE salary < 55000;

-- Employees earning  equal to 80000
SELECT * FROM employees WHERE salary = 80000;

-- Employees earning greater than or equal to 50000
SELECT * FROM employees WHERE salary >= 50000;

-- Employees earning less than or equal to 50000
SELECT * FROM employees WHERE salary <= 50000;

-- Employees earning not equal to 50000
SELECT * FROM employees WHERE salary <> 50000;


-- Logical Operators
-- Employees in IT department earning more than 45000
SELECT * FROM employees WHERE department = 'IT' AND salary > 45000;


-- Update Statement
UPDATE employees 
SET salary = salary * 1.10
WHERE department = 'IT';