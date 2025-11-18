CREATE DATABASE exist_practice;
USE exist_practice;

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE Projects (
    project_id INT,
    emp_id INT,
    project_name VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Amit', 'IT'),
(2, 'Sneha', 'HR'),
(3, 'Rahul', 'Finance'),
(4, 'Priya', 'IT'),
(5, 'Karan', 'Marketing');

INSERT INTO Projects VALUES
(101, 1, 'Website Development'),
(102, 1, 'Database Migration'),
(103, 3, 'Budget Analysis'),
(104, 4, 'Mobile App');

SELECT * FROM Employees;
SELECT * FROM Projects;

# Find employees who are working on at least one project.
SELECT name, department FROM Employees e
WHERE EXISTS (
SELECT 1 FROM Projects p
WHERE p.emp_id = e.emp_id
);

# Find employees who are not assigned to any project.
SELECT name, department FROM Employees e
WHERE NOT EXISTS (
SELECT 1 FROM Projects p
WHERE p.emp_id = e.emp_id
);

# Find IT department employees who are assigned to projects.
SELECT name
FROM Employees e
WHERE department = 'IT'
  AND EXISTS (
      SELECT 1
      FROM Projects p
	  WHERE p.emp_id=e.emp_id
);

# Find employees who are working on a project named "Database Migration".
SELECT name
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Projects p
    WHERE p.emp_id = e.emp_id
      AND p.project_name = 'Database Migration'
);


# Find HR employees who are not assigned to any project.
SELECT name
FROM Employees e
WHERE department = 'HR'
  AND NOT EXISTS (
      SELECT 1
      FROM Projects p
      WHERE p.emp_id=e.emp_id
);