CREATE DATABASE HRC_1;
USE HRC_1;

CREATE TABLE departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50) NOT NULL,
gender CHAR(1) CHECK (gender IN('M', 'F')),
dept_id INT,
salary DECIMAL(10,2),
hire_date DATE,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments(dept_id,dept_name)VALUES
(10,'IT'),
(20,'HR'),
(30,'SALES');

SELECT * FROM departments;

INSERT INTO employees(emp_id,emp_name,gender,dept_id,salary,hire_date)VALUES
(101,'Rahul','M',10, 55000, '2019-03-15'),
(102,'Priya','F',20, 65000, '2020-07-10'),
(103,'Suresh','M',10, 48000, '2021-02-12'),
(104,'Ananya','F',30, 72000, '2018-11-01'),
(105,'Kiran','M',20, 51000, '2022-06-20');

UPDATE employees SET hire_data = '2024-03-15' WHERE emp_id = 105;

SELECT * FROM employees;

-- 1. Show details of employees hired after 2020-01-01.
SELECT*FROM employees
WHERE hire_date > '2020-01-01';

-- 2. Find the total number of employees in each department.

SELECT dept_id, COUNT(emp_id)AS TotalEmployees
FROM employees GROUP BY dept_id;

-- 3. List names and salaries of employees earning more than ₹50,000.

SELECT emp_name,salary
FROM employees
WHERE salary>50000;

-- 4. Retrieve names of all female employees
SELECT emp_name
FROM employees
WHERE gender = 'F';

-- 5. Show details of employees hired after 2020-01-01.

SELECT*FROM employees
WHERE hire_date>'2020-01-01';

 
-- 6. Display all departments in alphabetical order.

SELECT dept_name
FROM departments order by dept_name ASC;

-- 7. Calculate the average salary of employees in the IT department.

SELECT AVG(salary) AS avg_salary FROM employees 
WHERE dept_id = (SELECT dept_id FROM departments WHERE dept_name='IT');

-- 8. Display the department name and total salary paid per department.

SELECT d.dept_name, SUM(e.salary) AS total_salary 
FROM employees e 
JOIN departments d ON e.dept_id=d.dept_id GROUP BY d.dept_name;

-- 9. Count the number of male and female employees.

SELECT gender,count(*)AS totalemployees
FROM employees
GROUP BY gender;

-- 10. Find the highest and lowest salary in each department.

SELECT dept_id,
MAX(salary) AS highestsalary,
MIN(salary) AS lowestsalary
FROM employees
GROUP BY dept_id;


-- Find employees whose names start with the letter ‘A’.

SELECT * FROM employees
WHERE emp_name like 'A%';

-- Retrieve details of employees whose salary is between ₹50,000 and ₹70,000.

 SELECT * FROM employees
 WHERE salary BETWEEN 50000 AND 70000;

-- Show all employees not in the HR department.
SELECT emp_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name <> 'HR';

-- Show department names with more than 1 employee.


SELECT dept_id,  COUNT(*) AS totalemployees
FROM employees
GROUP BY dept_id HAVING COUNT(*) > 1;


-- Write a query to print Department Name and Total Number of Employees, sorted by highest count first.

SELECT d.dept_name, COUNT(e.emp_id)AS totalemployees
FROM employees e
LEFT JOIN 
departments d
ON 
e.dept_id = d.dept_id 
GROUP BY d.dept_name
ORDER BY totalemployees DESC;

-- List employees who earn more than the average salary of all employees.
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees
);

-- Display all employee names along with their department names

SELECT e.emp_name, d.dept_name FROM employees e
INNER JOIN departments d 
ON e.dept_id = d.dept_id;

-- Display employees hired in the last 2 years. (cognizant)
SELECT * FROM employees 
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Employees hired in same year as ‘Rahul’
SELECT emp_name FROM employees 
WHERE YEAR(hire_date) = (SELECT YEAR(hire_date) 
FROM employees WHERE emp_name = 'Rahul');

-- Top 3 highest paid employees 
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- Most recent hire (youngest)
SELECT emp_name, hire_date FROM employees ORDER BY hire_date DESC LIMIT 1;

-- Total Payroll
SELECT SUM(salary) AS Total_Payroll FROM employees;

-- Employees whose names contain 'r'
SELECT emp_name FROM employees WHERE emp_name LIKE '%r%';

-- Departments with avg salary > 60k
SELECT d.dept_name, AVG(e.salary) AS Avg_Salary 
FROM employees e 
INNER JOIN departments d 
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;

-- Write a query to display first three characters of each employees's name
SELECT emp_name, SUBSTRING(emp_name, 1,3) AS short_name 
FROM employees; 

-- Show employee name, salary, and salary grade based on:
-- Salary < 50,000 → Grade C
-- 50,000–70,000 → Grade B
-- 70,000 → Grade A

SELECT emp_name, salary, 
CASE 
WHEN salary < 50000 THEN 'C'
WHEN salary BETWEEN 50000 AND 70000 THEN 'B'
ELSE 'A'
END AS grade FROM employees;

-- Retrieve employees whose department name ends with ‘S’
SELECT e.emp_name, d.dept_name FROM employees e
INNER JOIN departments d 
ON e.dept_id = d.dept_id
WHERE d.dept_name LIKE '%S';

-- find total number of employees joined each year
SELECT YEAR(hire_date) AS year_joined, COUNT(*) AS Total 
FROM employees GROUP BY YEAR(hire_date);

-- Departments with male employees 
SELECT DISTINCT d.dept_name FROM employees e
JOIN departments d 
ON e.dept_id = d.dept_id 
WHERE e.gender = 'M';

# LEVEL 4 – CHALLENGE (Common in MNC coding rounds)
-- Find Nth highest salary (use subquery or window function).
-- Example: Find 3rd highest salary

SELECT DISTINCT salary FROM employees e1
WHERE 3 = (
	SELECT COUNT(DISTINCT e2.salary)
    FROM employees e2
    WHERE e2.salary >= e1.salary
);    
-- Using windows function
SELECT emp_name, salary
FROM (
	SELECT emp_name, salary,
		DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_pos
    FROM employees
) ranked
WHERE rank_pos = 3;    

-- Display department name having the maximum total salary payout.
SELECT dept_name, SUM(salary) AS Total_Payout
FROM employees e 
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY Total_Payout DESC LIMIT 1;

-- Show employees hired before their department’s oldest employee (tricky join).
SELECT e.emp_name, e.dept_id, e.hire_date
FROM employees e
WHERE e.hire_date < (
SELECT MIN(e2.hire_date)
FROM employees e2
WHERE e2.dept_id = e.dept_id
);

-- Find employees whose salary is within 10% of the max salary.
SELECT emp_name, salary FROM employees 
WHERE salary >= 0.9 * (SELECT MAX(salary) FROM employees);

-- Create a query to find duplicate salaries in the company.
SELECT salary, COUNT(*) AS count_same FROM employees
GROUP BY salary 
HAVING COUNT(*) > 1;

-- Display department name, number of employees, and difference between max & min salary.
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees, 
(MAX(e.salary) - MIN(e.salary)) AS salary_difference 
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Find employees with same salary as another employee
SELECT e1.emp_name, e1.salary
FROM employees e1
JOIN employees e2 ON e1.salary = e2.salary AND e1.emp_id <> e2.emp_id 
ORDER BY e1.salary;

-- Update salary of all HR employees by 10%

UPDATE employees 
SET salary = salary * 1.10
WHERE dept_id = (
SELECT dept_id FROM departments WHERE dept_name = 'HR'
);
SELECT * FROM employees;

-- Delete employees earning less than 40,000 (use DELETE).
DELETE FROM employees WHERE salary < 40000;

-- Add a new department named “FINANCE” (use INSERT).
INSERT INTO departments(dept_id, dept_name) VALUE
(40,'Finance');

SELECT * FROM departments;