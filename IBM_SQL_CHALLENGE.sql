CREATE DATABASE IBM_SQL_CHALLENGE;
USE IBM_SQL_CHALLENGE;

CREATE TABLE Departments(
DeptID INT PRIMARY KEY,
DeptName VARCHAR (50),
Location VARCHAR (50)
);

CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(50),
Gender CHAR(1),
Salary DECIMAL(10,2),
JoinDate DATE,
DeptID INT,
ManagerID INT,
FOREIGN KEY (DeptID) REFERENCES Departments (DeptID)
);

CREATE TABLE Projects (
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR (50),
StartDate DATE,
EndDate DATE,
DeptID INT,
FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Departments VALUES
(1, 'IT', 'Bangalore'),
(2, 'HR', 'Pune'),
(3, 'Finance', 'Mumbai'),
(4, 'Marketing', 'Delhi');

INSERT INTO Employees VALUES 
(101, 'Amit', 'M', 55000, '2021-01-10', 1, NULL),
(102, 'Priya', 'F', 60000, '2020-03-15', 1, 101),
(103, 'Ravi', 'M', 45000, '2022-07-12', 2, 102),
(104, 'Sneha', 'F', 70000, '2019-10-01', 3, 101),
(105, 'Arjun', 'M', 50000, '2021-08-23', 4, 102),
(106, 'Meena', 'F', 80000, '2018-05-11', 1, 101),
(107, 'Vijay', 'M', 47000, '2023-04-19', 2, 103);


-- Projects
INSERT INTO Projects VALUES
(201,'Watson AI','2021-06-01','2022-12-31',1),
(202,'BlueMix Cloud','2022-01-15','2023-06-30',1),
(203,'HR Portal','2020-09-01','2021-04-01',2),
(204,'Finance Tracker','2021-03-10','2022-09-10',3),
(205,'Brand Campaign','2023-01-01',NULL,4);

SELECT * FROM Departments;
SELECT * FROM Employees ;
SELECT * FROM Projects;

-- 1) Display all employee names and their department names.
SELECT e.EmpName , d.DeptName FROM Employees e 
INNER JOIN Departments d 
ON e.DeptID = d.DeptID;

-- 2) List emloyeese who joined after 1st jan 2021. 
SELECT * FROM Employees WHERE JoinDate > '2021-01-01';

-- 3) Find the total number of employees in each department.
SELECT COUNT(e.EmpID), d.DeptName AS Total_Employees FROM Employees e 
INNER JOIN Departments d 
On e.DeptID = d.DeptID
GROUP BY DeptName;

-- 4)  Show all projects handled by the 'IT' deparment.
SELECT p.ProjectName, d.DeptName FROM Projects p
INNER JOIN Departments d
ON p.DeptID = d.DeptID
WHERE DeptName = 'IT';

-- 5) Display the names of all female employees
SELECT EmpName FROM Employees WHERE Gender = 'F';

-- 6) Find the highest salary in each department
SELECT MAX(e.Salary), d.DeptName FROM Employees e 
INNER JOIN Departments d
ON e.DeptID = d.DeptID 
GROUP BY DeptName;

-- 7) List Employees whose salary is above the average salary
SELECT EmpName, Salary FROM Employees 
WHERE Salary > (SELECT AVG(Salary) FROM Employees) ;

-- 8) Display deparments that have more than one project.
SELECT d.DeptName, COUNT(p.ProjectID) FROM Departments d 
INNER JOIN Projects p
ON d.DeptID = p.DeptID
GROUP BY d.DeptName
HAVING COUNT(p.ProjectID) > 1;

-- 9) Show employee names along with their manager's names.
SELECT EmpName, ManagerID FROM Employees ;

SELECT e.EmpName AS Employee, m.EmpName AS Manager
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID= m.EmpID;


-- 10) Find the department where project duration (EndDate-StartDate) is longest.
SELECT d.DeptName, MAX(datediff(p.EndDate,p.StartDate)) AS longest_duration
FROM Departments d 
INNER JOIN Projects p
ON d.DeptID = p.DeptID 
GROUP BY d.DeptName
ORDER BY longest_duration DESC LIMIT 1;

SELECT d.DeptName, p.ProjectName,
DATEDIFF(p.EndDate, p.StartDate) AS DurationDays
FROM Projects p
JOIN Departments d ON p.DeptID = d.DeptID
WHERE p.EndDate IS NOT NULL
ORDER BY DurationDays DESC
LIMIT 1;