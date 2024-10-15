-- Products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Customers table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Order items table
CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);
-- Insert products
INSERT INTO products (product_name, price, stock_quantity)
VALUES ('Laptop', 999.99, 50),
       ('Smartphone', 499.99, 100),
       ('Tablet', 299.99, 75),
       ('Headphones', 49.99, 200),
       ('Smartwatch', 199.99, 150);

-- Insert customers
INSERT INTO customers (first_name, last_name, email)
VALUES ('Ryan', 'Tibbo', 'ryan.tibbo@keyin.com'),
       ('Brandon', 'Shea', 'brandon.shea@keyin.com'),
       ('Adam', 'Stevenson', 'adam.stevenson@keyin.com'),
       ('Bradley', 'Ayers', 'bradley.ayers@keyin.com');

-- Insert orders
INSERT INTO orders (customer_id, order_date)
VALUES (1, '2024-10-15'),
       (2, '2024-10-16'),
       (3, '2024-10-17'),
       (4, '2024-10-18'),
       (1, '2024-10-19');

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity)
VALUES (1, 1, 1), (1, 2, 2), -- Order 1
       (2, 3, 1), (2, 4, 3), -- Order 2
       (3, 5, 1), (3, 1, 1), -- Order 3
       (4, 2, 1), (4, 3, 1), -- Order 4
       (5, 4, 2), (5, 5, 1); -- Order 5

--SQL Queries

-- Retrieve names and stock quantities of all products
SELECT product_name, stock_quantity
FROM products;

-- Retrieve product names and quantities for specific order
SELECT p.product_name, oi.quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
WHERE oi.order_id = 1;  -- Replace 1 with the order ID you want to query

-- Retrieve all orders placed by specific customer
SELECT o.id AS order_id, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id
WHERE c.id = 1;  -- Replace 1 with the customer ID
