CREATE DATABASE Company2;

CREATE TABLE Employee_Information(
id INT,
first_name VARCHAR(255),
last_name VARCHAR(255),
salary INT,
department_id VARCHAR(255),
hire_date VARCHAR(255)
);

SELECT * FROM Employee_Information;

INSERT INTO Employee_Information (id, first_name, last_name, salary, department_id, hire_date) VALUES 
(1,"Alice","Johnson",60000,1,"2020-01-15"),
(2,"Bob","Smith",45000,2,"2019-03-22"),
(3,"Charlie","Brown",70000,1,"2021-07-10"),
(4,"David","Wilson",55000,3,"2018-11-05"),
(5,"Eva","Davis",50000,NULL,"2022-05-12"),
(6,"Frank","Miller",65000,2,"2020-09-30"),
(7,"Grace","Lee",48000,5,"2017-06-18");

DROP TABLE Employee_Information;

-- 1) SELECT ALL COLUMNS
SELECT * FROM Employee_Information;

-- 2) SELECT FIRST_NAME AND SALARY
SELECT first_name,salary FROM Employee_Information;

-- 3) EMPLOYEES WITH SALARY >50000
SELECT first_name,last_name,salary FROM Employee_Information WHERE salary > 50000;

-- 4) ORDER BY HIRE_DATE DESCENDING
SELECT hire_date FROM Employee_Information ORDER BY hire_date DESC;

-- 5) TOTAL NUMBER OF EMPLOYEES
SELECT COUNT(id) FROM Employee_Information;