CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
	EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
    );
    
-- Stored Procedure of Company DB
CREATE DATABASE store_db;
USE store_db;

CREATE TABLE products (
	ProductId INT PRIMARY KEY,
    ProductName VARCHAR (100),
    Category VARCHAR (50),
    Price DECIMAL (10,2)
);

CREATE DATABASE school_db;
USE school_db ;

CREATE TABLE students (
	StudentID INT PRIMARY KEY,
    StudentName VARCHAR (100),
    Course VARCHAR (50),
    Marks INT 
);

-- SHOW ALL 
DELIMITER $$
CREATE PROCEDURE ShowAllEmployees ()
BEGIN 
		SELECT * FROM employees;
END $$
DELIMITER ;

CALL ShowAllEmployees();

-- UPDATE 
DELIMITER $$
CREATE PROCEDURE UpdateEmployee (IN p_EmpID INT, IN p_EmpName VARCHAR(100), IN p_Dept VARCHAR(50), IN p_salary DECIMAL(10,2))
BEGIN 
	UPDATE employees SET EmpName = p_EmpName, Department = p_Dept, Salary = p_Salary WHERE EmpID = p_EmpID;
END $$
DELIMITER ;    

-- ADD
DELIMITER $$ 
CREATE PROCEDURE AddEmployee (IN p_EmpID INT, IN p_EmpName VARCHAR(100), IN p_Dept VARCHAR(50), IN p_Salary DECIMAL (10,2))
BEGIN 
	INSERT INTO employees VALUES (p_EmpID, p_EmpName, p_Dept, p_Salary);
END $$ 
DELIMITER ;

-- GET BY ID
DELIMITER $$
CREATE PROCEDURE GetEmployeeByID (IN p_EmpID INT)
BEGIN 
	SELECT * FROM employees WHERE EmpID = p_EmpID;
END $$
DELIMITER ;

-- DELETE
DELIMITER $$
CREATE PROCEDURE DeleteEmployee (IN p_EmpID INT)
BEGIN 
		DELETE FROM employees WHERE EmpID = p_EmpID;
END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS ShowAllEmployees;
DROP PROCEDURE IF EXISTS UpdateEmployee;
DROP PROCEDURE IF EXISTS AddEmployee;
DROP PROCEDURE IF EXISTS GetEmployeeByID;
DROP PROCEDURE IF EXISTS DeleteEmployee;

DELIMITER $$
CREATE PROCEDURE ShowAllStudents()
BEGIN 
     SELECT * FROM students;
END$$
DELIMITER ;

CALL ShowAllStudents;

DELIMITER $$
CREATE PROCEDURE AddStudent(IN p_ID INT,IN p_Name VARCHAR(100),IN p_Course VARCHAR(50),IN p_Marks INT)
BEGIN 
	 INSERT INTO students VALUES (p_ID, p_Name, p_Course, p_Marks);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE GetStudentByID(IN p_ID INT)
BEGIN
      SELECT * FROM students WHERE StudentID = p_ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE UpdateStudent(IN p_ID INT,IN p_Name VARCHAR(100),IN p_Course VARCHAR(50),IN p_Marks INT)
BEGIN 
	 Update students SET StudentName = p_Name,Course=p_Course,Marks= p_Marks WHERE StudentID= p_ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE DeleteStudentM(IN p_ID INT)
BEGIN 
	 DELETE FROM students WHERE StudentID = p_ID;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS ShowAllEmployees;
DROP PROCEDURE IF EXISTS UpdateEmployee;
DROP PROCEDURE IF EXISTS AddEmployee;
DROP PROCEDURE IF EXISTS GetEmployeeBYID;
DROP PROCEDURE IF EXISTS DeleteEmployee;


SELECT * FROM students;






DELIMITER $$

CREATE PROCEDURE ShowAllProducts()
BEGIN 
     SELECT * FROM products;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE AddProduct(
    IN p_ID INT,
    IN p_Name VARCHAR(100),
    IN p_Category VARCHAR(50),
    IN p_Price DECIMAL(10,2)
)
BEGIN
    INSERT INTO products VALUES (p_ID, p_Name, p_Category, p_Price);
END$$

CREATE PROCEDURE GetProductById(IN p_ID INT)
BEGIN
    SELECT * FROM products WHERE ProductID = p_ID;
END$$

CREATE PROCEDURE UpdateProduct(
    IN p_ID INT,
    IN p_Name VARCHAR(100),
    IN p_Category VARCHAR(50),
    IN p_Price DECIMAL(10,2)
)
BEGIN
    UPDATE products
    SET ProductName = p_Name, Category = p_Category, Price = p_Price
    WHERE ProductID = p_ID;
END$$

CREATE PROCEDURE DeleteProduct(IN p_ID INT)
BEGIN
    DELETE FROM products WHERE ProductID = p_ID;
END$$
DELIMITER ;



SHOW PROCEDURE STATUS WHERE Db='store_db';

DROP PROCEDURE IF EXISTS ShowAllProducts;
