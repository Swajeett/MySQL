CREATE DATABASE Self_Join_Example;
USE Self_Join_Example;

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

SELECT * FROM Hospital;

SELECT 
P.PersonName AS PatientName,
D.PersonName AS DoctorName
FROM Hospital P 
JOIN Hospital D
ON P.DoctorID = D.PersonID 
WHERE P.Role = 'Patient' AND D.Role = 'Doctor';