-- ============================================================================
-- SQL Portfolio Workbook: Comprehensive Analytics Tracking
-- Target Database: E-Commerce & Retail Omnichannel Analytics
-- Description: Solutions for Challenges 1 through 8.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Challenge 1: Online Volume Discovery
-- Objective: Retrieve all columns from online orders to establish a baseline view.
-- ----------------------------------------------------------------------------
SELECT * 
FROM orders_online;


-- ----------------------------------------------------------------------------
-- Challenge 2: Target Core Product Line
-- Objective: Retrieve only the product identification numbers from the retail channel.
-- ----------------------------------------------------------------------------
SELECT product_id 
FROM orders_retail;


-- ----------------------------------------------------------------------------
-- Challenge 3: Strategic Column Aliasing
-- Objective: Select order details while providing professional, clean aliases.
-- ----------------------------------------------------------------------------
SELECT 
    order_id AS online_transaction_id,
    product_id AS item_code,
    quantity AS units_purchased
FROM orders_online;


-- ----------------------------------------------------------------------------
-- Challenge 4: High-Velocity Online Orders
-- Objective: Filter online records for transactions with large quantities.
-- ----------------------------------------------------------------------------
SELECT * 
FROM orders_online 
WHERE quantity >= 5;


-- ----------------------------------------------------------------------------
-- Challenge 5: In-Store Product Isolation
-- Objective: Find all retail transactions for a specific high-priority product.
-- ----------------------------------------------------------------------------
SELECT * 
FROM orders_retail 
WHERE product_id = 12;


-- ----------------------------------------------------------------------------
-- Challenge 6: Premium Price Tier Analysis
-- Objective: Query the master inventory for products exceeding a premium price point.
-- ----------------------------------------------------------------------------
SELECT * 
FROM products 
WHERE price > 100.00;


-- ----------------------------------------------------------------------------
-- Challenge 7: Chronological Retail Audit
-- Objective: Sort retail orders to see the newest transactions first.
-- ----------------------------------------------------------------------------
SELECT * 
FROM orders_retail 
ORDER BY order_date DESC;


-- ----------------------------------------------------------------------------
-- Challenge 8: Online Inventory Value Priority
-- Objective: Sort items by quantity descending, breaking ties by product ID.
-- ----------------------------------------------------------------------------
SELECT 
    order_id, 
    product_id, 
    quantity 
FROM orders_online 
ORDER BY quantity DESC, product_id ASC;
