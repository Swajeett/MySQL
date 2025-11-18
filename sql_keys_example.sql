CREATE DATABASE sql_keys_example;
USE sql_keys_example;

# PRIMARY KEY - A Primary Key uniquely identifies each record in a table.
-- Create table: Department
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert sample data
INSERT INTO Department (dept_id, dept_name)
VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
SELECT * FROM Department;

# FOREIGN KEY - A Foreign Key links one table to another
-- Create table: Employee
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Insert sample data
INSERT INTO Employee (emp_id, emp_name, dept_id)
VALUES
(101, 'Alice', 1),
(102, 'Bob', 2),
(103, 'Charlie', 3),
(104, 'Daisy', 2);

SELECT * FROM 	Employee;

# COMPOSITE KEY - A Composite Key consists of two or more columns together acting as a unique key
-- Create table: Project_Assignment
CREATE TABLE Project_Assignment (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Insert sample data
INSERT INTO Project_Assignment (emp_id, project_id, role)
VALUES
(101, 501, 'Developer'),
(101, 502, 'Tester'),
(102, 501, 'Manager'),
(103, 503, 'Analyst');

SELECT * FROM Project_Assignment;

