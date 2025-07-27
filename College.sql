CREATE DATABASE College;

USE College;

CREATE TABLE Students(
StudentID INT,
Name VARCHAR(255),
Roll_No INT,
Department VARCHAR(255)
);

SELECT * FROM Students;

INSERT INTO Students (StudentID, Name, Roll_No, Department) VALUES (1,"SWAJIT BHAGWAT",001,"E&TC");

INSERT INTO Students (StudentID, Name, Roll_No, Department) VALUES
 (2,"SANKET BHAGWAT",002,"DM"),
 (3,"SUMIT PATIL",003,"CSE"),
 (4,"ANIKET JADHAV",004,"CIVIL"),
 (5,"ROHAN DESAI",005,"ELECTRONICS");











