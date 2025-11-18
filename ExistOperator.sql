CREATE DATABASE exist_operator;
USE exist_operator;

CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE Enrollments (
    enroll_id INT,
    student_id INT,
    course VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Amit', 'Computer Science'),
(2, 'Sneha', 'Electronics'),
(3, 'Rahul', 'Mechanical'),
(4, 'Priya', 'Computer Science'),
(5, 'Karan', 'Civil');

INSERT INTO Enrollments VALUES
(101, 1, 'Database Systems'),
(102, 1, 'Operating Systems'),
(103, 2, 'Microprocessors'),
(104, 4, 'Artificial Intelligence');

SELECT * FROM Students;
SELECT * FROM Enrollments;

# Find all students who are enrolled in at least one course.
SELECT name, department FROM Students s 
WHERE EXISTS (
SELECT 1 FROM Enrollments e
WHERE e.student_id = s.student_id
);

# Find all students who are not enrolled in any course.
SELECT name, department
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.student_id = s.student_id
);

# Find all students from Computer Science who are enrolled in at least one course.
SELECT name
FROM Students s WHERE department = 'Computer Science'
  AND EXISTS (
      SELECT 1
      FROM Enrollments e
      WHERE e.student_id = s.student_id
);

# Find all students who are enrolled in a course named "Database Systems".
SELECT name FROM Students s
WHERE EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.student_id = s.student_id
      AND e.course = 'Database Systems'
);

# Find all students from Electronics department who are not enrolled in any course.
SELECT name FROM Students s WHERE department = 'Electronics'
AND NOT EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.student_id = s.student_id
);
