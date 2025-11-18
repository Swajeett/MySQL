CREATE DATABASE mysql_null_functions;
USE mysql_null_functions;

CREATE TABLE employees (
emp_id INT,
emp_name VARCHAR (50),
department VARCHAR (30),
bonus DECIMAL (10,2),
comission DECIMAL (10,2)
);

INSERT INTO employees (emp_id, emp_name, department, bonus, comission) VALUES
(1, 'Amit', 'Sales', 5000, 1000),
(2, 'Sneha', 'HR', NULL, 2000),
(3, 'Raj', 'IT', 3000, NULL),
(4, 'Priya', 'Finance', NULL, NULL),
(5, 'Karan', 'Marketing', 7000, 1500);

CREATE TABLE 	employee_income (
emp_id INT,
emp_name VARCHAR(50),
total_income DECIMAL(10,2),
remarks VARCHAR(50)
);

-- Using IFNULL() or COALESCE()
-- IFNULL(column, value) → replaces NULL with given value.
-- COALESCE(a, b, c, …) → returns first non-NULL value.

INSERT INTO employee_income (emp_id, emp_name, total_income, remarks)
SELECT 
emp_id,
emp_name,
(IFNULL(bonus, 0) + IFNULL(comission, 0)) AS total_income,
CASE 
WHEN bonus IS NULL AND comission IS NULL THEN 'No Bonus or Comission'
WHEN bonus IS NULL THEN 'No Bonus'
WHEN comission IS NULL THEN 'No Comission'
ELSE 'Full Income'
END AS remarks
FROM employees;

SELECT * FROM employee_income;