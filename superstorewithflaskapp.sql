CREATE DATABASE superstore_db;
USE superstore_db;

CREATE TABLE login (
ID INT AUTO_INCREMENT PRIMARY KEY,
Email VARCHAR (100),
Password VARCHAR (100)
);

INSERT INTO login (ID, Email, Password) VALUES
(1,"swajit@example.com", "Example@1234"),
(2,"Sanket@example.com", "Example@0001"); 

SELECT * FROM login;