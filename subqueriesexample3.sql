CREATE DATABASE subqueries_example3;
USE subqueries_example3;

CREATE TABLE CarShowroom (
    CarName VARCHAR(50),
    Brand VARCHAR(50),
    Price INT,
    city VARCHAR(50)
);

INSERT INTO CarShowroom (CarName, Brand, Price, City) VALUES
('Swift', 'Maruti', 600000, 'Mumbai'),
('Baleno', 'Maruti', 800000, 'Pune'),
('Creta', 'Hyundai', 1200000, 'Delhi'),
('Venue', 'Hyundai', 1100000, 'Mumbai'),
('Fortuner', 'Toyota', 3500000, 'Bangalore'),
('Innova', 'Toyota', 2500000, 'Pune'),
('City', 'Honda', 1500000, 'Delhi'),
('Amaze', 'Honda', 900000,'Mumbai');

SELECT * FROM CarShowroom;

# Find cars more expensive than the average price
SELECT CarName, Brand, Price FROM CarShowroom WHERE Price > (SELECT AVG(Price) FROM CarShowroom);

# Cars available in the same city as ‘Fortuner’
SELECT CarName, city FROM CarShowroom WHERE City = (SELECT City FROM CarShowroom WHERE CarName = 'Fortuner');

# Cars with highest price 
SELECT CarName,Brand, Price From CarShowroom WHERE Price = (SELECT MAX(Price) FROM CarShowroom);

# Cars cheaper than any Honda car
SELECT CarName, Brand, Price FROM CarShowroom WHERE Price < (SELECT MIN(Price) FROM CarShowroom WHERE Brand = 'Honda');

# Brands that have cars in mumbai
SELECT CarName, Brand, City FROM CarShowroom WHERE Brand IN (SELECT Brand FROM CarShowroom WHERE City ='Mumbai');

