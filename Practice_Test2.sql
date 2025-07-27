CREATE DATABASE Practice_Test2;

USE Practice_Test2;

CREATE TABLE banking (
AccountNumber INT,
CustomerName VARCHAR(100),
AccountType VARCHAR(20),
Branch VARCHAR (50),
Balance DECIMAL (10,2),
OpenDate Date,
Status VARCHAR (10)

);

SELECT * FROM banking;

DROP TABLE banking;

INSERT INTO banking (AccountNumber, CustomerName, AccountType, Branch, Balance, OpenDate, Status) VALUES
(101, 'Alice Sharma', 'Savings', 'Delhi', 15000.00, '2020-01-15', 'Active'),
(102, 'Rajiv Mehra', 'Current', 'Mumbai', 32000.00, '2019-06-20', 'Inactive'),
(103, 'Neha Singh', 'Savings', 'Bangalore', 21000.00, '2021-02-10', 'Active'),
(104, 'Amit Verma', 'Fixed', 'Delhi', 50000.00, '2018-12-25', 'Closed'),
(105, 'Priya Gupta', 'Savings', 'Chennai', 18000.00, '2022-04-01','Active'),
(106, 'Karan Joshi', 'Current', 'Mumbai', 40000.00, '2020-08-18', 'Active'),
(107, 'Sonal Rathi', 'Fixed', 'Kolkata', 60000.00, '2019-09-12', 'Inactive'),
(108, 'Meena Das', 'Savings', 'Delhi', 22000.00, '2023-01-03', 'Active'),
(109, 'Rohit Nair', 'Current', 'Bangalore', 30000.00, '2021-11-11', 'Active'),
(110, 'Tanya Bhatia', 'Savings', 'Mumbai', 17000.00, '2022-07-22', 'Active');


-- 1. List all customer records from the banking table.
SELECT * FROM banking;

-- 2. Find all customers who have a savings account.
SELECT CustomerName FROM banking WHERE AccountType = 'Savings';

-- 3. Show all accounts that were opened after January 1,2021.
SELECT * FROM banking WHERE OpenDate > '2021-01-01';

-- 4. What is the total balance available across all accounts?
SELECT SUM(Balance) FROM banking;
 
-- 5. Count the number of customers in each branch.
SELECT COUNT(CustomerName),Branch FROM banking GROUP BY Branch;

-- 6. Find the customer with the highest account balance.
SELECT * FROM banking ORDER BY Balance DESC LIMIT 1;

-- 7. List customers whose account status is 'Inactive'
SELECT * FROM banking WHERE Status = 'Inactive';

-- 8. Show the average balance for each account type.
SELECT AVG(Balance) FROM banking;

-- 9. Retrieve all accounts with a balance between 15,000 and 30,000.
SELECT * FROM banking WHERE Balance BETWEEN 15000 AND 30000;

-- 10. List all customers from the Delhi branch
SELECT * FROM banking WHERE Branch = 'Delhi';

-- 11. How many accounts have a status of 'Closed' -----------------
SELECT * FROM banking WHERE Status = 'Closed';

-- 12. List all the distinct account types available in the table.
SELECT DISTINCT AccountType FROM banking;

-- 13. Find customers whose numbers start with the letter 'A'.  ------------

-- 14. Display all customer records ordered by balance in descending order.
SELECT * FROM banking ORDER BY Balance DESC;

-- 15. Show the number of accounts per account type and branch.
SELECT AccountNumber,AccountType,Branch FROM banking;