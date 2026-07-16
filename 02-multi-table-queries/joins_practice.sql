-- ==============================================================================
-- SQL JOINS & AGGREGATION AUDIT SCRIPT
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- Baseline Discovery: See all data from both tables (No Join)
-- ------------------------------------------------------------------------------
SELECT * FROM products;
SELECT * FROM suppliers;


-- ------------------------------------------------------------------------------
-- Challenge 1: Premium Electronics Check
-- Goal: Find all products in the 'Electronics' category priced over 100.00, 
-- ordered from highest to lowest price.
-- ------------------------------------------------------------------------------
SELECT 
    p.product_name,
    p.price,
    s.supplier_name
FROM products AS p
INNER JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE p.category = 'Electronics' 
  AND p.price > 100.00
ORDER BY p.price DESC;


-- ------------------------------------------------------------------------------
-- Challenge 2: Immediate Out-of-Stock Alert
-- Goal: Identify products that are completely sold out (stock = 0) and pull 
-- their vendor names.
-- ------------------------------------------------------------------------------
SELECT
    s.supplier_name,
    p.product_name
FROM products AS p
INNER JOIN suppliers AS s
    ON p.id = s.supplier_id 
WHERE p.stock_quantity = 0;


-- ------------------------------------------------------------------------------
-- Challenge 3: Total Portfolio Value per Supplier
-- Goal: Calculate total inventory value (price * stock) grouped by vendor name, 
-- excluding completely unstocked items.
-- ------------------------------------------------------------------------------
SELECT
    s.supplier_name,
    SUM(p.price * p.stock_quantity) AS total_supplier_value
FROM products AS p
FULL JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE p.stock_quantity > 0
GROUP BY s.supplier_name;


-- ------------------------------------------------------------------------------
-- Challenge 4: Domestic Supply Chain Filter (USA)
-- Goal: List all products sourced explicitly from suppliers based in the USA.
-- ------------------------------------------------------------------------------
SELECT
    p.product_name,
    p.price,
    s.country
FROM products AS p
LEFT JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE s.country = 'USA';


-- ------------------------------------------------------------------------------
-- Challenge 5: The "Loner Product" Audit
-- Goal: Find completely orphaned products that failed to find any matching 
-- supplier record in the system.
-- ------------------------------------------------------------------------------
SELECT
    p.product_name,
    s.supplier_name
FROM products AS p
LEFT JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE s.supplier_id IS NULL;


-- ------------------------------------------------------------------------------
-- Challenge 6: Left-Join Risk Assessment (Out-of-Stock Tracking)
-- Goal: Show out-of-stock items, ensuring products keep their record visibility 
-- regardless of matching vendor integrity.
-- ------------------------------------------------------------------------------
SELECT
    s.supplier_name,
    p.product_name,
    p.stock_quantity
FROM products AS p
LEFT JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE p.stock_quantity = 0;


-- ------------------------------------------------------------------------------
-- Challenge 7: The 'C' / 'P' Product Inventory Value
-- Goal: Calculate inventory asset valuation for items matching name patterns, 
-- broken down by vendor.
-- ------------------------------------------------------------------------------
SELECT
    p.product_name,
    s.supplier_name,
    SUM(p.price * p.stock_quantity) AS inventory_value
FROM products AS p
FULL JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE p.product_name LIKE 'C%'
GROUP BY s.supplier_name, p.product_name;


-- ------------------------------------------------------------------------------
-- Challenge 8: The High-Ticket International Audit
-- Goal: Isolate premium products (> 300.00) sourced from vendors outside the USA.
-- ------------------------------------------------------------------------------
SELECT 
    p.product_name,
    p.price,
    s.supplier_name,
    s.country
FROM products AS p
LEFT JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE p.price > 300.00 
  AND s.country NOT IN ('USA');


-- ------------------------------------------------------------------------------
-- Challenge 9: The Full Horizon Check
-- Goal: Run a comprehensive operational view pairing all products and suppliers 
-- regardless of whether matching mapping IDs exist.
-- ------------------------------------------------------------------------------
SELECT
    s.supplier_name,
    p.product_name
FROM products AS p
FULL JOIN suppliers AS s
    ON p.id = s.supplier_id;


-- ------------------------------------------------------------------------------
-- Challenge 10: The High-Stock 'S' Vendor Check
-- Goal: List suppliers starting with 'S' managing bulk batches (stock > 50).
-- ------------------------------------------------------------------------------
SELECT
    s.supplier_name,
    p.product_name,
    p.stock_quantity
FROM suppliers AS s
LEFT JOIN products AS p
    ON p.id = s.supplier_id
WHERE p.stock_quantity > 50
  AND s.supplier_name LIKE 'S%';


-- ------------------------------------------------------------------------------
-- Challenge 11: The Budget Hardware Sweep
-- Goal: Audit inexpensive products (< 100.00) classified strictly under 'Hardware'.
-- ------------------------------------------------------------------------------
SELECT
    p.product_name,
    p.category,
    p.price,
    s.country
FROM products AS p
LEFT JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE p.category = 'Hardware' 
  AND p.price < 100.00;


-- ------------------------------------------------------------------------------
-- Challenge 12: The Missing Country Alert
-- Goal: Catch compliance data gaps where active suppliers are missing country entries.
-- ------------------------------------------------------------------------------
SELECT
    p.product_name,
    s.supplier_name
FROM products AS p
FULL JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE s.country IS NULL;


-- ------------------------------------------------------------------------------
-- Challenge 13: Premium Electronics Aggregate
-- Goal: Track average ticket value for 'Electronics' over 200.00 by supplier.
-- ------------------------------------------------------------------------------
SELECT
    s.supplier_name,
    AVG(p.price) AS avg_premium_price
FROM products AS p
LEFT JOIN suppliers AS s
    ON p.id = s.supplier_id
WHERE p.category = 'Electronics' 
  AND p.price > 200.00
GROUP BY s.supplier_name;


-- ------------------------------------------------------------------------------
-- Challenge 14: The Empty Warehouse Audit
-- Goal: Surface total operational dead-zones where stock is 0 or completely unmapped.
-- ------------------------------------------------------------------------------
SELECT
    s.supplier_name,
    p.stock_quantity
FROM suppliers AS s
LEFT JOIN products AS p
    ON p.id = s.supplier_id
WHERE p.stock_quantity = 0
   OR p.stock_quantity IS NULL;
