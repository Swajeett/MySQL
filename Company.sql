CREATE DATABASE Company;

USE Company;

CREATE TABLE Employee(
EmployeeID INT,
Name VARCHAR (255),
Salary INT,
Department VARCHAR(255),
Experience INT
);

SELECT * FROM Employee;

INSERT INTO Employee (EmployeeID, Name, Salary, Department, Experience) VALUES 
(1,"Swajit Bhagwat",700000,"IT",1),
(2,"Sanketkar Bhagwat",800000,"HR",2),
(3,"Ahishek Bhagwat",750000,"SALES",5),
(4,"Aniket Bhagwat",800000,"DEVELOPMENT",2),
(5,"Suyash Bhagwat",750000,"OPERATIONS",4);


-- SELECT EMPLOYEE WHOSE SALARY IS BETWEEN 7 TO 7.5 
SELECT * FROM Employee WHERE Salary  BETWEEN 700000 AND 750000;

-- SELECT EMPLOYEE WHOSE DEPARTMENT IS IT
SELECT * FROM Employee WHERE Department = "IT";

-- SELECT EMPLOYE WHOSE EMPLOYEEID IS 2
SELECT * FROM Employee WHERE EmployeeID = 2;



