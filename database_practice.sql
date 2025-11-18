CREATE DATABASE database_practice;
USE database_practice;

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);

INSERT INTO Employees VALUES
(1, 'Amit', 'HR', 40000, '2021-05-10'),
(2, 'Sneha', 'IT', 55000, '2020-02-15'),
(3, 'Rohit', 'Finance', 60000, '2019-11-20'),
(4, 'Priya', 'IT', 75000, '2022-01-12'),
(5, 'Vikas', 'HR', 30000, '2023-07-05');

SELECT * FROM Employees;

# Find all employees with salary greater than 50,000.
SELECT * FROM Employees WHERE salary > 50000;

# List employees who work in IT department.
SELECT * FROM Employees WHERE department = 'IT';

# Show employees who joined between 2020 and 2022.
SELECT * FROM Employees WHERE join_date BETWEEN '2020-01-01' AND '2022-01-01';

# Find employees whose name starts with “S”.
SELECT * FROM Employees WHERE name LIKE 'S%';

# Show employees not in HR.
SELECT * FROM Employees WHERE NOT department = 'HR';