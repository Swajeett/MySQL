CREATE DATABASE key_practice;
USE key_practice;

CREATE TABLE students(
id INT PRIMARY KEY,
name VARCHAR(100),
roll_no INT,
mob_number INT,
department VARCHAR(100)
);

CREATE TABLE department (
dept_id INT,
dept_name VARCHAR (100),
FOREIGN KEY (dept_id) REFERENCES students(id)
);
