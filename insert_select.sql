CREATE DATABASE mysql_insert_select;
USE mysql_insert_select;

CREATE TABLE employees (
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR (30),
salary DECIMAL (10,2)
);

CREATE TABLE employees_backup (
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR (30),
salary DECIMAL (10,2)
);

INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
(1,'Amit', 'HR', 40000),
(2,'Sneha', 'IT', 55000),
(3,'Raj', 'Finance', 60000),
(4,'Priya', 'IT', 65000),
(5,'Karan', 'Marketing', 50000);

SELECT * FROM employees;

-- copy data from employees to employees_backup where department = 'IT'.
INSERT INTO employees_backup (emp_id, emp_name, department, salary)
SELECT emp_id, emp_name, department, salary FROM employees
WHERE department = 'IT';

SELECT * FROM employees_backup;