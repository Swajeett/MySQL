CREATE DATABASE wildcards;
USE wildcards;

CREATE TABLE Employees(
EmpName VARCHAR (50),
Department VARCHAR(50),
City VARCHAR (50)
);

INSERT INTO Employees (EmpName, Department, City) VALUES
('Alice Johnson', 'HR', 'New York'),
('Bob Smith', 'Finance', 'London'),
('Charlie Brown', 'IT', 'New Delhi'),
('David Miller', 'Finance', 'Paris'),
('Eve Adams', 'IT', 'New York'),
('Frank White', 'HR', 'Berlin'),
('George King', 'Marketing', 'London');

# Find employee whose name starts with 'A'
SELECT * FROM Employees WHERE EmpName LIKE 'A%';

# Find employeees whose name is 4 letters and ends with 'e'
SELECT * FROM 	Employees WHERE EmpName LIKE '___e%';

# Find employees where city has 'on' in it (like london)
SELECT * FROM Employees WHERE city LIKE '%on%';

# Find employees not in cities containing 'New'
SELECT * FROM Employees WHERE city NOT LIKE '%New%';