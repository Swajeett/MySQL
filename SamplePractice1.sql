CREATE DATABASE Sample_Practice_1;
USE Sample_Practice_1;

CREATE TABLE Bank_Details (
SchemeID INT,
LowerLimit INT,
UpperLimit INT,
InterestRate DECIMAL(10,2),
CreatedDate DATE,
CreatedBy INT,
ModifiedDATE DATE,
ModifiedBy INT
);
SELECT * FROM Bank_Details;
DROP TABLE Bank_Details;
INSERT INTO Bank_Details VALUES 
(1,0,2000,5.40,'2005-01-01',4,'2006-02-05',2),
(1,4000,6000,5.60,'2005-01-01',4,'2006-02-05',2),
(1,6000,15000,5.80,'2005-01-01',4,'2006-02-05',2),
(1,15000,100000,6.10,'2005-01-01',4,'2006-02-05',2),
(2,0,1000,2.40,'2007-09-03',5,'2008-10-07',1),
(2,1000,3000,2.60,'2007-09-03',5,'2008-10-07',1),
(2,3000,10000,2.80,'2007-09-03',5,'2008-10-07',1),
(2,10000,100000,3.10,'2007-09-03',5,'2008-10-07',1),
(3,0,10000,3.92,'2006-04-06',6,'2007-05-11',3),
(3,10000,20000,3.85,'2006-04-06',6,'2007-05-11',3),
(3,20000,50000,3.79,'2006-04-06',6,'2007-05-11',3),
(3,50000,100000,3.74,'2006-04-06',6,'2007-05-11',3),
(4,0,7000,4.07,'2006-08-13',2,'2007-09-17',4),
(4,7000,15000,4.00,'2006-08-13',2,'2007-09-17',4),
(4,15000,40000,3.94,'2006-08-13',2,'2007-09-17',4),
(4,40000,80000,3.89,'2006-08-13',2,'2007-09-17',4);

# Find the highest and lowest interest rates available across all schemes.
SELECT InterestRate AS Highest FROM Bank_Details ORDER BY InterestRate DESC LIMIT 1;
SELECT InterestRate AS Lowest FROM Bank_Details ORDER BY InterestRate ASC LIMIT 1;


# List all schemes with an interest rate greater than 5%.
SELECT * FROM Bank_Details WHERE InterestRate > 5; 

# Find the average interest rate for each Scheme ID.
SELECT AVG(InterestRate) FROM Bank_Details;

# Show all records created by user ID 5. -----------

# Count how many records were modified after 01-Jan-2007.-------
SELECT COUNT(*) FROM Bank_Details WHERE DATE > '2007-01-01';

# List all schemes where the range (UpperLimit – LowerLimit) is more than 50,000.------
SELECT * FROM Bank_Details WHERE UpperLimit AND LowerLimit >= 50000;

# Identify which user (CreatedBy) has created the maximum number of records.----------

# Find all schemes where the interest rate decreased after modification.---------

# Calculate the average interest rate for all schemes with LowerLimit greater than 10,000.
SELECT AVG(InterestRate) FROM Bank_Details WHERE LowerLimit > 10000;

# Show the Scheme IDs which were modified by more than one unique user.------

