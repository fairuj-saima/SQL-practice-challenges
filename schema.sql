-- =========================================================================
-- DATABASE CLEANUP & INITIALIZATION (DDL & DML)
-- =========================================================================

-- ⚠️ WARNING: 
-- Running 'DROP TABLE' will permanently DELETE the table and all of its 
-- data. Only use this in development/testing environments. NEVER run 
-- this on a live production database unless you absolutely mean to wipe it!

-- 💡 Why "IF EXISTS"? 
-- If the table doesn't exist yet (like the very first time you run this script),
-- a standard 'DROP TABLE' will throw an error and halt your script.
-- Adding 'IF EXISTS' tells SQL: "Delete it if it is there, otherwise do nothing."
DROP TABLE IF EXISTS products;


-- 1. Create the products table
CREATE TABLE products (
    id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT,
    release_date DATE,
    CONSTRAINT pk_products PRIMARY KEY (id)
);


-- 2. Insert initial mockup data
INSERT INTO products (id, product_name, category, price, stock_quantity, release_date)
VALUES
    (1, 'Wireless Mouse', 'Electronics', 29.99, 150, '2024-01-15'),
    (2, 'Mechanical Keyboard', 'Electronics', 89.99, 45, '2023-11-10'),
    (3, 'Leather Journal', 'Stationery', 15.50, 200, '2024-03-01'),
    (4, 'Gel Pen Set (12-pack)', 'Stationery', 12.00, 0, '2023-05-20'),
    (5, 'Noise-Cancelling Headphones', 'Electronics', 199.99, 12, '2024-05-12'),
    (6, 'Ergonomic Desk Chair', 'Furniture', 249.99, 8, '2023-08-15'),
    (7, 'Stainless Steel Water Bottle', 'Kitchen', 24.50, 85, '2024-02-10');
