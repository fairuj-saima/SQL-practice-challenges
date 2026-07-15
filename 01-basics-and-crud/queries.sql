-- ==========================================
-- SQL practice log: DML, DDL, and Queries
-- ==========================================

-- 1. Get unique product counts per category
SELECT DISTINCT 
    category,
    COUNT(id) AS product_count
FROM products
GROUP BY category;

-- 2. Find the item with the highest stock
SELECT TOP 1 *
FROM products
ORDER BY stock_quantity DESC;

-- 3. Delete a product by name
DELETE FROM products
WHERE product_name = 'Ergonomic Desk Chair';

-- 4. Apply a $5 flat increase to Electronics
UPDATE products
SET price = price + 5.00
WHERE category = 'Electronics';

-- 5. Find categories with more than 1 product
SELECT category, COUNT(category)
FROM products
GROUP BY category
HAVING COUNT(category) > 1;

-- 6. Add and drop dynamic columns (DDL)
ALTER TABLE products ADD discount_price DECIMAL(5, 2);
ALTER TABLE products DROP COLUMN is_active;
ALTER TABLE products DROP COLUMN release_date;

-- 7. Insert a new product
INSERT INTO products (id, product_name, category, price, stock_quantity, release_date)
VALUES (8, 'Wireless Charger', 'Electronics', 19.99, 50, '2024-06-01');

-- 8. Select mid-range priced items
SELECT product_name, price
FROM products
WHERE price BETWEEN 15.00 AND 1000.00;

-- 9. Find expensive categories (Avg price > $50)
SELECT 
    category, 
    AVG(price) AS Average_price
FROM products
GROUP BY category
HAVING AVG(price) > 50.00;

-- 10. Clear out completely out-of-stock items
DELETE FROM products
WHERE stock_quantity = 0;

-- 11. Sort unique categories alphabetically
SELECT DISTINCT category
FROM products
ORDER BY category ASC;

-- 12. Restock stationery
UPDATE products 
SET stock_quantity = 100
WHERE category = 'Stationery';

-- 13. Find categories with massive stock levels (>100 total units)
SELECT 
    category,
    SUM(stock_quantity)
FROM products
GROUP BY category
HAVING SUM(stock_quantity) > 100;

-- 14. Find cheap electronics
SELECT *
FROM products
WHERE category = 'Electronics' AND price <= 50.00;

-- 15. Run a 20% clearance markdown on low stock
UPDATE products
SET price = price * 0.8
WHERE stock_quantity < 50;

-- 16. Select top 2 stocked items
SELECT TOP 2
    product_name,
    stock_quantity
FROM products
ORDER BY stock_quantity DESC;

-- 17. Find categories with exactly 1 product
SELECT category
FROM products
GROUP BY category
HAVING COUNT(category) = 1;

-- 18. Find mid-range products sorted descending
SELECT product_name, price
FROM products
WHERE price BETWEEN 10.00 AND 30.00
ORDER BY price DESC;

-- 19. Find total stock sum
SELECT SUM(stock_quantity) AS total_products
FROM products;

-- 20. Find categories where the max item is over $100
SELECT category, MAX(price)
FROM products
GROUP BY category
HAVING MAX(price) > 100.00;

-- 21. Count total product rows
SELECT COUNT(id) FROM products;

-- 22. Adjust electronics stock upwards
UPDATE products
SET stock_quantity = stock_quantity + 15
WHERE category = 'Electronics';

-- 23. Find expensive electronics
SELECT product_name, category, price
FROM products
WHERE category = 'Electronics' AND price > 100.00;

-- 24. Find the cheapest item per category
SELECT category, MIN(price)
FROM products
GROUP BY category;
