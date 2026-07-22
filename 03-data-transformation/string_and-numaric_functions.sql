-- ============================================================================
-- Module 03: Data Transformation
-- File: string_and_numeric_functions.sql
-- Description: Practice queries using T-SQL string manipulation, math functions,
--              precision rounding, and pattern matching.
-- Engine: Microsoft SQL Server (T-SQL)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. Category Formatting & Length Analysis
-- Demonstration: UPPER(), LEN()
-- ----------------------------------------------------------------------------
SELECT
    id,
    category,
    UPPER(category) AS clean_category,
    LEN(category) AS category_length
FROM products;


-- ----------------------------------------------------------------------------
-- 2. Custom SKU Generation
-- Demonstration: CONCAT(), UPPER(), RIGHT()
-- ----------------------------------------------------------------------------
SELECT
    id,
    product_name,
    CONCAT(UPPER(RIGHT(product_name, 4)), '-', id) AS sku_code
FROM products;


-- ----------------------------------------------------------------------------
-- 3. Case-Insensitive Pattern Search
-- Demonstration: LOWER(), LIKE
-- ----------------------------------------------------------------------------
SELECT 
    id, 
    product_name, 
    price 
FROM products 
WHERE LOWER(product_name) LIKE '%pro%';


-- ----------------------------------------------------------------------------
-- 4. Financial Precision & Discount Rounding (15% Off)
-- Demonstration: Basic Arithmetic, ROUND(), CEILING()
-- ----------------------------------------------------------------------------
SELECT
    id,
    price,
    price - (price * 0.15) AS dis_price,
    ROUND(price - (price * 0.15), 2) AS rounded_dis,
    CEILING(price - (price * 0.15)) AS celi_dis
FROM products;


-- ----------------------------------------------------------------------------
-- 5. Whitespace Cleaning & Length Comparison
-- Demonstration: TRIM(), UPPER(), LEN()
-- ----------------------------------------------------------------------------
SELECT
    product_name,
    UPPER(TRIM(product_name)) AS clean_name,
    LEN(product_name) AS raw_length,
    LEN(TRIM(product_name)) AS clean_length
FROM products;


-- ----------------------------------------------------------------------------
-- 6. Character Masking & Prefix Extraction
-- Demonstration: Nested REPLACE(), LEFT()
-- ----------------------------------------------------------------------------
SELECT
    product_name,
    REPLACE(REPLACE(product_name, 'a', '@'), 'A', '@') AS masked_name,
    LEFT(product_name, 3) AS short_code
FROM products;


-- ----------------------------------------------------------------------------
-- 7. Baseline Variance & Absolute Magnitude
-- Demonstration: Subtraction, ABS()
-- ----------------------------------------------------------------------------
SELECT
    id,
    price,
    (price - 50.00) AS raw_dif,
    ABS(price - 50.00) AS abs_dif
FROM products;
