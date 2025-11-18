CREATE DATABASE Stored_Procedure_Flask;
USE Stored_Procedure_Flask;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

DELIMITER $$

CREATE PROCEDURE ShowAllEmployees()
BEGIN
    SELECT * FROM Employees;
END$$

DELIMITER ;

CALL ShowAllEmployees();



DELIMITER $$ 

CREATE PROCEDURE AddEmployee(
	IN p_EmpID INT,
    IN p_EmpName VARCHAR (100),
    IN p_Dept VARCHAR (50),
    IN p_Salary DECIMAL (10,2)
)
BEGIN 
		INSERT INTO Employees (EmpID, EmpName, Department, Salary)
        VALUES (p_EmpID, p_EmpName, p_Dept, p_Salary);
END $$

DELIMITER ;     

CALL AddEmployee(1,'Swajit','IT',80000);   
        
        