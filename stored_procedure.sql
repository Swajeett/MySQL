CREATE DATABASE stored_procedure;
USE stored_procedure;

CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(100),
Department VARCHAR (50),
Salary DECIMAL(10,2)
);

SELECT * FROM Employees; -- WITHOUT SP

-- WITH SP 
DELIMITER $$

CREATE PROCEDURE ShowAllEmployees()
BEGIN 
	SELECT * FROM Employees;
END $$

DELIMITER ;    

CALL ShowAllEmployees();

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

DELIMITER $$
CREATE PROCEDURE salary()
BEGIN
	SELECT * FROM Employees WHERE Salary BETWEEN 75000 AND 100000;
END $$
DELIMITER ;     

CALL salary();

-- Procedure with Input Parameter

-- Let's say you want employees from a specific department:

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDept(IN DeptName VARCHAR(50))
BEGIN 
	SELECT * FROM Employees 
    WHERE Department = DeptName;
END $$ 

DELIMITER ;

CALL GetEmployeesByDept('IT');    

-- DROP PROCEDURE IF EXISTS GetEmployeesByDept;

-- procedure with multiple parameters

DELIMITER $$ 

CREATE PROCEDURE GetEmployeesByNameAndDept(
	IN p_EmpName VARCHAR (100),
    IN p_DeptName VARCHAR (50)
)
BEGIN 
	SELECT * FROM Employees 
    WHERE EmpName = p_EmpName AND Department = p_DeptName;
END $$ 

DELIMITER ;

CALL GetEmployeesByNameAndDept ('Swajit', 'IT');

-- Procedure with Output Parameter 

DELIMITER $$

CREATE PROCEDURE GetEmployeeSalary(
	IN p_EmpID INT,
    OUT p_Salary DECIMAL (10,2)
)    
BEGIN 
	SELECT Salary INTO p_Salary FROM Employees
    WHERE EmpID = p_EmpID;
END $$

DELIMITER ;
 
SET @sal = 0;
CALL GetEmployeeSalary (3,@sal);
SELECT @sal AS EmployeeSalary;

DELIMITER $$

CREATE PROCEDURE UpdateEmployeeSalary(
	IN p_EmpID INT,
    IN p_NewSalary DECIMAL(10,2)
)
BEGIN 
	UPDATE Employees 
    SET Salary = p_NewSalary
    WHERE EmpID = p_EmpID;
END $$

DELIMITER ;    

CALL UpdateEmployeeSalary (5, 95000.00);

SELECT * FROM Employees WHERE EmpID = 5;

-- Procedure to Delete Data
DELIMITER $$
CREATE PROCEDURE DeleteEmployee(
	IN p_EmpID INT
)
BEGIN 
	DELETE FROM Employees WHERE EmpID = p_EmpID;
END $$
DELIMITER ;

CALL DeleteEmployee (10);

SELECT * FROM Employees WHERE EmpiID = 10;    