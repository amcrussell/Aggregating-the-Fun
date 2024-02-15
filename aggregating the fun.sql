-- Create the schema
DROP SCHEMA IF EXISTS aggregating_the_fun;
CREATE SCHEMA aggregating_the_fun;
USE aggregating_the_fun;


-- Create customers table
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

-- Insert sample data into customers table
INSERT INTO customers (customer_id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Mike', 'Johnson'),
(4, 'Emily', 'Brown');

-- Create products table
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  category VARCHAR(255),
  price DECIMAL(10, 2)
);

-- Insert sample data into products table
INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Product A', 'Electronics', 100.00),
(2, 'Product B', 'Electronics', 200.00),
(3, 'Product C', 'Home Appliances', 50.00),
(4, 'Product D', 'Home Appliances', 75.00);

-- Create orders table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  total_price DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data into orders table
INSERT INTO orders (order_id, customer_id, total_price) VALUES
(1, 1, 100.00),
(2, 2, 250.00),
(3, 1, 200.00),
(4, 3, 75.00),
(5, 4, 50.00),
(6, 2, 100.00);

-- 1
SELECT COUNT(*) AS total_customers FROM customers;

-- 2
SELECT SUM(total_price) AS total_earnings_from_orders FROM orders;

-- 3
SELECT AVG(price) AS avg_val, MIN(price) AS min_val, MAX(price) AS max_val FROM products;

-- 4
SELECT customer_id, COUNT(*) AS total_number_of_orders FROM orders GROUP BY customer_id DESC;

-- 5
SELECT customer_id, SUM(total_price) AS total_revenue_from_customer FROM orders GROUP BY customer_id DESC;

-- 6
SELECT 
	o.customer_id,
    SUM(o.total_price) AS total_revenue_from_customer,
    c.first_name,
    c.last_name
FROM orders o 
JOIN  customers c on c.customer_id = o.customer_id
GROUP BY customer_ID ASC limit 3;

-- 7
SELECT
	customer_id,
AVG(total_price) as average
FROM orders
GROUP BY customer_id
ORDER BY average DESC;




