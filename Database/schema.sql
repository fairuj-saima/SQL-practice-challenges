-- ==============================================================================
-- 📊 DATABASE SCHEMA INITIALIZATION & DATA SEEDING (RELATIONAL MODE)
-- Project: SQL Practice Challenges & Sales Channels Ecosystem
-- Scope: Multi-Table Layout (Suppliers, Products, Online Orders, Retail Orders)
-- ==============================================================================

-- ⚠️ WARNING: 
-- Running this script will completely drop existing 'products' and 'suppliers' 
-- tables. All existing data in these tables will be permanently deleted. 
-- Ensure you back up any critical test modifications before executing.

-- ------------------------------------------------------------------------------
-- 1. INFRASTRUCTURE TEARDOWN (Child Tables Dropped First to Prevent FK Violations)
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS orders_online;
DROP TABLE IF EXISTS orders_retail;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;

-- ------------------------------------------------------------------------------
-- 2. TABLE STRUCTURE CREATION
-- ------------------------------------------------------------------------------

-- 🏢 Table: suppliers
-- Description: Stores profile details for external wholesale vendors.
CREATE TABLE suppliers (
    supplier_id INT NOT NULL,         
    supplier_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    CONSTRAINT pk_suppliers PRIMARY KEY (supplier_id)
);

-- 📦 Table: products
-- Description: Core inventory table tracking product lines and wholesale vendor ties.
CREATE TABLE products (
    id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT,
    release_date DATE,
    supplier_id INT, 
    CONSTRAINT pk_products PRIMARY KEY (id),
    CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) 
        REFERENCES suppliers(supplier_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- 💻 Table: orders_online
-- Description: Tracks web-based purchases. Relational columns strictly non-nullable.
CREATE TABLE orders_online (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    order_date DATE,
    CONSTRAINT pk_order_online PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_online_products FOREIGN KEY (product_id)
        REFERENCES products(id)
);

-- 🏪 Table: orders_retail
-- Description: Tracks physical store walk-in purchases. Relational columns strictly non-nullable.
CREATE TABLE orders_retail (
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    order_date DATE,
    CONSTRAINT pk_order_retail PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_online_retail FOREIGN KEY (product_id)
        REFERENCES products(id)
);

-- ------------------------------------------------------------------------------
-- 3. CORE MASTER SEEDING (Suppliers & Products)
-- ------------------------------------------------------------------------------

-- Insert all Wholesale Suppliers
INSERT INTO suppliers (supplier_id, supplier_name, country) VALUES
(1, 'Apex Electronics', 'Japan'),
(2, 'Global Office Supplies', 'USA'),
(3, 'EcoKitchen Ltd', 'Canada'),
(4, 'Future Tech Corp', 'South Korea'),
(5, 'Nordic Timber Co', 'Sweden'),
(8, 'Titanium Heavy Industries', 'Germany'),
(9, 'AeroSpace Logistics', 'USA'),
(10, 'Neo-Seoul Foundry', 'South Korea'),
(11, 'Prism Optics Group', 'Canada'),
(12, 'Midnight Leatherworks', 'Italy'),
(13, 'Apex Bio-Tech Trading', 'Singapore'),
(14, 'Omega Solar Systems', 'Australia'),
(15, 'Pixel & Matrix Displays', 'Taiwan'),
(16, 'Velvet Thread Weavers', 'Egypt'),
(17, 'Phantom Labs Corp', 'USA');

-- Insert all Products (Ensuring all required IDs exist to satisfy transactional constraints)
INSERT INTO products (id, product_name, category, price, stock_quantity, release_date, supplier_id) VALUES
(1, 'Wireless Mouse', 'Electronics', 29.99, 150, '2024-01-15', 1),
(2, 'Mechanical Keyboard', 'Electronics', 89.99, 45, '2023-11-10', 2),
(3, 'Leather Journal', 'Stationery', 15.50, 200, '2024-03-01', 3),
(4, 'Gel Pen Set (12-pack)', 'Stationery', 12.00, 0, '2023-05-20', 4),
(5, 'Noise-Cancelling Headphones', 'Electronics', 199.99, 12, '2024-05-12', 5),
(6, 'Ergonomic Desk Chair', 'Furniture', 249.99, 8, '2023-08-15', NULL),
(7, 'Stainless Steel Water Bottle', 'Kitchen', 24.50, 85, '2024-02-10', NULL),
(11, 'Next-Gen VR Headset', 'Electronics', 799.99, 12, NULL, 11),
(12, 'Anodized Titanium Bolt Pack', 'Hardware', 45.00, 300, NULL, 12),
(13, 'Carbon Fiber Drone Frame', 'Aerospace', 299.50, 25, NULL, 13),
(14, '4K Laser Projector Lens', 'Electronics', 1250.00, 5, NULL, 14),
(15, 'Full-Grain Italian Belt', 'Apparel', 85.00, 40, NULL, 15),
(16, 'Ergonomic Standing Desk', 'Office Supplies', 420.00, 0, NULL, 16),
(17, 'Industrial Grade Solar Panel', 'Hardware', 350.00, 80, NULL, 17),
(18, '240Hz OLED Panel Replacement', 'Electronics', 199.99, 15, NULL, NULL),
(19, 'Dark Matter Cooling Fluid', 'Electronics', 24.99, 500, NULL, NULL),
(20, 'Cyberpunk Leather Trenchcoat', 'Apparel', 350.00, 8, NULL, NULL);

-- ------------------------------------------------------------------------------
-- 4. SALES TRANSACTIONS SEEDING (28 Verified Relational Rows)
-- ------------------------------------------------------------------------------

-- Seeding: orders_online (14 Records)
INSERT INTO orders_online (order_id, customer_id, product_id, quantity, order_date) VALUES
(101, 501, 1,  2,  '2026-07-10'),  
(102, 502, 2,  1,  '2026-07-11'),  
(103, 503, 5,  1,  '2026-07-12'),  -- Identical cross-channel mirror row
(104, 504, 11, 1,  '2026-07-14'),
(105, 510, 12, 50, '2026-07-16'), 
(106, 511, 13, 2,  '2026-07-16'), 
(107, 512, 14, 1,  '2026-07-17'),  -- Identical cross-channel mirror row
(108, 513, 15, 2,  '2026-07-17'), 
(109, 514, 17, 4,  '2026-07-18'), 
(110, 515, 1,  1,  '2026-07-18'), 
(111, 516, 2,  2,  '2026-07-19'), 
(112, 517, 5,  1,  '2026-07-19'), 
(113, 518, 12, 20, '2026-07-19'), 
(114, 519, 13, 1,  '2026-07-19');

-- Seeding: orders_retail (14 Records)
INSERT INTO orders_retail (order_id, customer_id, product_id, quantity, order_date) VALUES
(201, 505, 1,  1,  '2026-07-10'),  
(202, 506, 3,  3,  '2026-07-12'),  
(103, 503, 5,  1,  '2026-07-12'),  -- Identical cross-channel mirror row
(204, 507, 6,  1,  '2026-07-15'),
(205, 520, 12, 10, '2026-07-16'), 
(206, 521, 15, 1,  '2026-07-16'), 
(107, 512, 14, 1,  '2026-07-17'),  -- Identical cross-channel mirror row
(208, 522, 16, 1,  '2026-07-17'), 
(209, 523, 17, 2,  '2026-07-18'), 
(210, 524, 3,  5,  '2026-07-18'), 
(211, 525, 4,  2,  '2026-07-18'), 
(212, 526, 12, 15, '2026-07-19'), 
(213, 527, 15, 1,  '2026-07-19'), 
(214, 528, 2,  1,  '2026-07-19');
