CREATE DATABASE mysql_case;
USE mysql_case;

CREATE TABLE orders(
order_id INT,
customer_name VARCHAR(50),
product VARCHAR (50),
quantity INT,
price DECIMAL (10,2),
order_datr DATE
);

INSERT INTO orders (order_id, customer_name, product, quantity, price, order_datr)
VALUES 
(1, 'Amit', 'Laptop', 2, 55000, '2025-10-01'),
(2, 'Sneha', 'Mouse', 5, 500, '2025-10-02'),
(3, 'Raj', 'Phone', 1, 30000, '2025-10-03'),
(4, 'Priya', 'Tablet', 3, 1000, '2025-10-04'),
(5, 'Karan', 'Tablet', 1, 20000, '2025-10-05');

CREATE TABLE order_summary (
order_id INT,
customer_name VARCHAR (50),
product VARCHAR (50),
total_amount DECIMAL (10,2),
order_category VARCHAR (20)
);

-- Calculate total_amount = quantity * price
-- Categorize orders:
-- If total > 40000 → 'High Value'
-- If total BETWEEN 10000 and 40000 → 'Medium Value'
-- Else 'Low Value'

INSERT INTO order_summary (order_id, customer_name, product, total_amount, order_category)
SELECT 
order_id,
customer_name,
product,
(quantity * price) AS total_amount,
CASE
WHEN (quantity * price) > 40000 THEN 'High value'
WHEN (quantity * price) BETWEEN 10000 AND 40000 THEN 'Medium Value'
ELSE 'Low Value'
END AS order_category
FROM orders;

SELECT * FROM order_summary;