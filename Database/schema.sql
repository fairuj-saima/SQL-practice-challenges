-- ==============================================================================
-- 📊 DATABASE SCHEMA INITIALIZATION & DATA SEEDING
-- Project: SQL Practice Challenges
-- Scope: Multi-Table Layout (Products & Suppliers) - Independent Tables Mode
-- ==============================================================================

-- ⚠️ WARNING: 
-- Running this script will completely drop existing 'products' and 'suppliers' 
-- tables. All existing data in these tables will be permanently deleted. 
-- Ensure you back up any critical test modifications before executing.

-- ------------------------------------------------------------------------------
-- 1. INFRASTRUCTURE TEARDOWN
-- ------------------------------------------------------------------------------
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;

-- ------------------------------------------------------------------------------
-- 2. TABLE CREATION (Parent Table First)
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
-- Description: Core inventory table referencing its tracking vendor via Foreign Key.
CREATE TABLE products (
    id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT,
    release_date DATE,
    supplier_id INT, -- 🆕 The Relational Bridge Column
    CONSTRAINT pk_products PRIMARY KEY (id),
    CONSTRAINT fk_products_suppliers FOREIGN KEY (supplier_id) 
        REFERENCES suppliers(supplier_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- ------------------------------------------------------------------------------
-- 3. DATA SEEDING
-- ------------------------------------------------------------------------------

-- 🏢 Seeding: suppliers (Must be inserted before products due to FK constraints)
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


-- 📦 Seeding: products (With structured supplier mapping)
INSERT INTO products (id, product_name, category, price, stock_quantity, release_date, supplier_id)
VALUES
    (1, 'Wireless Mouse', 'Electronics', 29.99, 150, '2024-01-15', 1),
    (2, 'Mechanical Keyboard', 'Electronics', 89.99, 45, '2023-11-10', 2),
    (3, 'Leather Journal', 'Stationery', 15.50, 200, '2024-03-01', 3),
    (4, 'Gel Pen Set (12-pack)', 'Stationery', 12.00, 0, '2023-05-20', 4),
    (5, 'Noise-Cancelling Headphones', 'Electronics', 199.99, 12, '2024-05-12', 5),
    -- IDs 6 and 7 intentionally showcase orphan items (no matching suppliers)
    (6, 'Ergonomic Desk Chair', 'Furniture', 249.99, 8, '2023-08-15', NULL),
    (7, 'Stainless Steel Water Bottle', 'Kitchen', 24.50, 85, '2024-02-10', NULL);


-- 📦 Seeding: 10 NEW PRODUCTS (IDs 11 through 20 paired perfectly with active vendor IDs)
INSERT INTO products (id, product_name, category, price, stock_quantity, supplier_id) VALUES
(11, 'Next-Gen VR Headset', 'Electronics', 799.99, 12, 11),
(12, 'Anodized Titanium Bolt Pack', 'Hardware', 45.00, 300, 12),
(13, 'Carbon Fiber Drone Frame', 'Aerospace', 299.50, 25, 13),
(14, '4K Laser Projector Lens', 'Electronics', 1250.00, 5, 14),
(15, 'Full-Grain Italian Belt', 'Apparel', 85.00, 40, 15),
(16, 'Ergonomic Standing Desk', 'Office Supplies', 420.00, 0, 16),
(17, 'Industrial Grade Solar Panel', 'Hardware', 350.00, 80, 17),
-- IDs 18, 19, and 20 deliberately left unmapped to test anti-join alerts
(18, '240Hz OLED Panel Replacement', 'Electronics', 199.99, 15, NULL),
(19, 'Dark Matter Cooling Fluid', 'Electronics', 24.99, 500, NULL),
(20, 'Cyberpunk Leather Trenchcoat', 'Apparel', 350.00, 8, NULL);



