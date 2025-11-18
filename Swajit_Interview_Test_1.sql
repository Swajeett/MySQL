CREATE DATABASE Interview_test_1;
USE Interview_test_1;

CREATE TABLE Employees(
EmpID INT,
EmpName VARCHAR(50),
Department VARCHAR(50),
Salary DECIMAL (10,2),
JoinDate DATE
);

INSERT INTO Employees (EmpID, EmpName, Department, Salary, JoinDate) VALUES
(1, 'Sanket', 'HR', 60000, '2021-01-02'),
(2, 'Abhi', 'IT', 45000, '2022-02-10'),
(3, 'Aniket', 'HR', 50000, '2022-05-05'),
(4, 'Raj', 'IT', 80000, '2021-09-01'),
(5, 'Swajit', 'Finance', 40000, '2023-01-05');

-- Write a query to display all employee details.
SELECT * FROM Employees ;

-- Write a query to display unique department names.
SELECT DISTINCT Department FROM Employees;

-- Write a query to sort employees by salary in descending order.
SELECT EmpID,EmpName,Salary FROM Employees ORDER BY Salary DESC;

-- Find employees who joined after 2020.
SELECT EmpName, JoinDate FROM Employees WHERE JoinDate > '2020-01-01';

-- Write a query to find employees with salary greater than 50,000.
SELECT * FROM Employees WHERE Salary > 50000;

-- Display employees whose name starts with ‘A’.
SELECT * FROM Employees WHERE EmpName LIKE "A%";

-- Count total number of employees.
SELECT COUNT(EmpID) AS total_employees FROM Employees;

-- Display maximum, minimum, and average salary.
SELECT MAX(Salary), MIN(salary), AVG(Salary) FROM Employees; 

CREATE TABLE Department (
DeptID INT,
DeptName VARCHAR(50),
Location VARCHAR(50)
);

INSERT INTO Department (DeptID, DeptName, Location) VALUES
(100, 'HR', 'Mumbai'),
(101, 'IT', 'Pune'),
(100, 'Finance', 'Banglore');

SELECT * FROM Department;

-- Write a query to join Employees and Departments tables.
SELECT e.EmpID, e.EmpName, e.Department, e.Salary, e.JoinDate, d.Location, d.DeptID
FROM Employees e
LEFT JOIN Department d 
ON e.Department = d.DeptName

UNION 

SELECT e.EmpID, e.EmpName, e.Department, e.Salary, e.JoinDate, d.Location, d.DeptID
FROM Employees e
RIGHT JOIN Department d 
ON e.Department = d.DeptName;

-- Display employees working in ‘IT’ department.
SELECT * FROM Employees WHERE Department = 'IT';

-- Write a query to group employees by department and show total salary per department.
SELECT EmpName, Department, SUM(Salary) AS total_salary FROM Employees GROUP BY Department;

-- Find departments having more than 3 employees.

-- Write a query to display the top 3 highest paid employees.
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 3;

-- Display employees not assigned to any department.

-- Write a query using CASE to classify employees as “High”, “Medium”, “Low” salary.
SELECT EmpName, Department, Salary,
CASE 
WHEN Salary > 45000 THEN 'High Earner'
WHEN Salary BETWEEN 25000 AND 45000 THEN 'Mid Earner'
ELSE 'Low Earner'
END AS Salary_Classification
FROM Employees;

-- Write a query to update salary by 10% for employees in the “HR” department.


-- Delete employees who left before 2019 (use a hypothetical column if needed).

CREATE TABLE Projects (
ProjectID INT,
ProjectName VARCHAR(50),
startDate DATE, 
EndDate DATE, 
EmpID INT 
);

INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, EmpID) VALUES
(1001, 'Testing', '2021-01-01', '2022-01-01', 2),
(1002, 'Testing', '2021-10-01', '2022-10-01', 4),
(1003, 'Finance Status', '2023-05-10', '2024-05-10', 5),
(1004, 'Hiring Freshers', '2021-01-01', '2024-01-01', 1),
(1005, 'Hiring Professionals', '2021-01-01', '2023-01-01', 3);

SELECT * FROM Projects;


-- Write a query to find employees working on more than one project.

-- Display employees who are not assigned to any project.

-- Find average project duration.

-- Write a subquery to find employees whose salary is greater than the average salary.
SELECT EmpName, Salary FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM employees);

-- Write a query using EXISTS to find departments having employees.

-- Write a query using ANY / ALL to compare salaries between departments.

-- Find second highest salary without using LIMIT or TOP.
SELECT * FROM Employees ORDER BY Salary DESC LIMIT 2;

-- Write a self-join to display employees and their managers (use sample data).

-- Write a stored procedure or view to display active employees only.