CREATE DATABASE Any_All;
USE Any_All;

CREATE TABLE Hospital (
PersonID INT,
PersonName VARCHAR (50),
Role VARCHAR (20),
DoctorID INT
);

INSERT INTO Hospital (PersonID, PersonName, Role, DoctorID) VALUES
(1, 'Dr. Smith', 'Doctor', NULL),
(2, 'Dr. Johnson', 'Doctor', NULL),
(3, 'Alice', 'Patient', 1),
(4, 'Bob', 'Patient', 1),
(5, 'Charlie', 'Patient', 2),
(6, 'David', 'Patient', 2),
(7, 'Eve', 'Patient', 1);

ALTER TABLE Hospital ADD City VARCHAR(50);

UPDATE Hospital
SET City = CASE PersonID
WHEN 1 THEN 'New Delhi'
WHEN 2 THEN 'Mumbai'
WHEN 3 THEN 'Hyderabad'
WHEN 4 THEN 'New Delhi'
WHEN 5 THEN 'Pune'
WHEN 6 THEN 'Mumbai'
WHEN 7 THEN 'Hyderabad'
END;

SELECT * FROM Hospital;

-- a) Find doctors who have at least one patient
SELECT PersonName FROM Hospital 
WHERE Role = 'Doctor' 
AND PersonID = ANY (
SELECT DoctorID FROM Hospital WHERE Role = 'Patient'
);

SELECT PersonName FROM Hospital 
WHERE Role = 'Doctor' 
AND PersonID = ALL (
SELECT DoctorID FROM Hospital WHERE Role = 'Patient'
);

-- b) Find patients whose doctor is ANY doctor from New Delhi hospital branch (example with another column)
-- Assuming we had a column city
SELECT PersonName FROM Hospital
WHERE Role = 'Patient'
AND DoctorID = ANY ( 
SELECT PersonID FROM Hospital WHERE Role = 'Doctor' AND City = 'New Delhi'
);
