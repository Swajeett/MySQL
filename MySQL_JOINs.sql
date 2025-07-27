CREATE DATABASE MySQL_JOINs;

USE MySQL_JOINs;

CREATE TABLE Students (
Student_id INT,
name VARCHAR(50),
course_id INT
);

SELECT * FROM Students;

CREATE TABLE courses (
course_id INT,
course_name VARCHAR(50)
);

SELECT * FROM courses;

INSERT INTO Students VALUES 
(1, 'Anil', 101),
(2, 'Bina', 102),
(3, 'Chetan', 103),
(4, 'Deepa', 104),
(5, 'Esha', 105);

INSERT INTO courses VALUES
(101, 'MAth'),
(102, 'Science'),
(103, 'English'),
(104, 'History');

-- INNER JOIN

SELECT s.name, c.course_name
FROM Students s 
INNER JOIN courses c
ON s.course_id = c.course_id;

-- LEFT JOIN

SELECT s.name, c.course_name
FROM Students s
LEFT JOIN courses c
ON s.course_id = c.course_id;

-- RIGHT JOIN

SELECT s.name, c.course_name
FROM Students s
LEFT JOIN courses c
ON s.course_id = c.course_id;

-- CROSS JOIN 

SELECT s.name, c.course_name
FROM Students s
CROSS JOIN courses c;

-- SELF JOIN

SELECT A.name AS Students1, B.name AS Students2, A.course_id
FROM Students A 
JOIN Students B ON A.course_id = B.course_id
WHERE A.student_id < B.student_id;