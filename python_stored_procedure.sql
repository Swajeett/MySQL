CREATE DATABASE python_stored_procedure ;
USE python_stored_procedure;

CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(100),
Department VARCHAR (50),
Salary DECIMAL(10,2)
);

INSERT INTO Employees (EmpID, EmpName, Department, Salary) VALUES 
(1, 'Swajit', 'IT', '80000'),
(2, 'Abhi', 'Finance', '60000'),
(3, 'Sanket', 'Marketing', '100000'),
(4, 'Aniket', 'HR', '50000'),
(5, 'Pratik', 'IT', '70000'),
(6, 'Shreyas', 'Finance', '65000'),
(7, 'Nishant', 'HR', '60000'),
(8, 'Garry', 'IT', '80000'),
(9, 'Mohit', 'Marketing', '75000'),
(10, 'Nikhil', 'IT', '85000');

SELECT * FROM Employees;

DELIMITER $$
CREATE PROCEDURE ShowAllEmployees()
BEGIN 
	SELECT * FROM Employees;
END $$

DELIMITER ; 

DELIMITER $$    
CREATE PROCEDURE GetEmployeesByDept (IN p_DeptName VARCHAR(50))    
BEGIN 
	SELECT * FROM Employees WHERE Department = p_DeptName;
END $$

DELIMITER ;    

DELIMITER $$
CREATE PROCEDURE GetEmployeeSalary(
	IN p_EmpID INT,
    OUT p_Salary DECIMAL(10,2)
)
BEGIN
	SELECT Salary INTO p_Salary FROM Employees WHERE EmpID = p_EmpID;
END $$

DELIMITER ;   

 DELIMITER $$ 
 CREATE PROCEDURE AddEmployee (
	IN p_EmpID INT,
    IN p_EmpName VARCHAR(100),
    IN p_Dept VARCHAR(50),
    IN p_Salary DECIMAL(10,2)
)
BEGIN 
		INSERT INTO Employees VALUES (p_EmpID, p_EmpName, p_Dept, p_Salary);
END $$

DELIMITER ;        

CALL ShowAllEmployees();