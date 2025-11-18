CREATE DATABASE Joinsexamples;
USE Joinsexamples;

CREATE TABLE Students (
student_id INT,
student_name VARCHAR(50),
course_id INT
);

CREATE TABLE Courses (
course_id INT,
course_name VARCHAR (50),
teacher VARCHAR (50)
);

INSERT INTO Courses (course_id, course_name, teacher) VALUES
(1, 'Mathematics', 'Prof.Sharma'),
(2, 'Physics', 'Dr. Rao'),
(3, 'Chemistry', 'Dr. Nair'),
(4, 'Biology', 'Prof. Sen');

INSERT INTO Students (student_id, student_name, course_id) VALUES
(201, 'Anita', 1),
(202, 'Rahul', 2),
(203, 'Meena', 2),
(204, 'Suresh', 5),
(205, 'Kiran', NULL);

# INNER JOINS
SELECT s.student_id, s.student_name, c.course_name
FROM Students s
INNER JOIN Courses c
ON s.course_id = c.course_id;

# LEFT JOINS
SELECT s.student_id, s.student_name, c.course_name
FROM Students s 
LEFT JOIN Courses c 
ON s.course_id = c.course_id;

# RIGHT JOINS
SELECT s.student_id, s.student_name, c.course_name
FROM Students s 
RIGHT JOIN Courses c 
ON s.course_id = c.course_id;

# FULL OUTER JOIN
SELECT s.student_id, s.student_name, c.course_name
FROM Students s 
LEFT JOIN Courses c 
ON s.course_id = c.course_id

UNION 

SELECT s.student_id, s.student_name, c.course_name
FROM Students s 
RIGHT JOIN Courses c 
ON s.course_id = c.course_id;