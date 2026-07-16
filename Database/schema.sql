-- ==============================================================================
-- 📊 DATABASE SCHEMA INITIALIZATION & DATA SEEDING
-- Project: SQL Practice Challenges
-- Scope: Multi-Table Layout (Products & Suppliers) - Independent Tables Mode
-- ==============================================================================

-- ⚠️ WARNING: 
-- Running this script will completely drop existing 'products' and 'suppliers' 
-- tables. All existing data in these tables will be permanently deleted. 
-- Ensure you back up any critical test modifications before executing.

-- ==============================================================================
-- 1. INFRASTRUCTURE TEARDOWN
-- ==============================================================================
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;


-- 📦 Table: products
-- Description: Core inventory table holding product metrics, pricing, and stock tracking.
CREATE TABLE products (
    id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT,
    release_date DATE,
    CONSTRAINT pk_products PRIMARY KEY (id)
);

-- 🏢 Table: suppliers
-- Description: Stores profile details for external wholesale vendors.
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,         
    supplier_name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- 📦 Seeding: products
INSERT INTO products (id, product_name, category, price, stock_quantity, release_date)
VALUES
    (1, 'Wireless Mouse', 'Electronics', 29.99, 150, '2024-01-15'),
    (2, 'Mechanical Keyboard', 'Electronics', 89.99, 45, '2023-11-10'),
    (3, 'Leather Journal', 'Stationery', 15.50, 200, '2024-03-01'),
    (4, 'Gel Pen Set (12-pack)', 'Stationery', 12.00, 0, '2023-05-20'),
    (5, 'Noise-Cancelling Headphones', 'Electronics', 199.99, 12, '2024-05-12'),
    (6, 'Ergonomic Desk Chair', 'Furniture', 249.99, 8, '2023-08-15'),
    (7, 'Stainless Steel Water Bottle', 'Kitchen', 24.50, 85, '2024-02-10');


-- 🏢 Seeding: suppliers
INSERT INTO suppliers (supplier_id, supplier_name, country) VALUES
(1, 'Apex Electronics', 'Japan'),
(2, 'Global Office Supplies', 'USA'),
(3, 'EcoKitchen Ltd', 'Canada'),
(4, 'Future Tech Corp', 'South Korea'),
(5, 'Nordic Timber Co', 'Sweden');
