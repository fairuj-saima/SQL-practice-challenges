-- ==============================================================================
-- SQL Practice Challenges: Basics, CRUD, and Single-Table Power Queries
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. Basic Search: In-stock Wireless Products
-- Finds all products with "Wireless" in the name that are currently in stock.
-- ------------------------------------------------------------------------------
SELECT
	product_name,
	categoryFROM productsWHERE product_name LIKE '%Wireless%' AND stock_quantity > 0;

-- ------------------------------------------------------------------------------
-- 2. Basic Filtering: High-Value Items in Core Categories
-- Lists product details for Electronics, Stationery, or Kitchen items priced over $20.00.
-- ------------------------------------------------------------------------------
SELECT product_name,
	category,
	priceFROM productsWHERE category IN ('Electronics', 'Stationery', 'Kitchen') AND price > 20.00;

-- ------------------------------------------------------------------------------
-- 3. Range Filtering: Budget Mid-Range Exclusion
-- Retrieves products NOT in Furniture/Kitchen priced strictly between $10.00 and $50.00.
-- ------------------------------------------------------------------------------
SELECT *FROM productsWHERE category NOT IN ('Furniture', 'Kitchen') AND price BETWEEN 10.00 AND 50.00;

-- ------------------------------------------------------------------------------
-- 4. Advanced Logic: Low Stock / Premium Non-Stationery Items
-- Targets items needing attention (low stock OR high price) excluding Stationery.
-- ------------------------------------------------------------------------------
SELECT *FROM productsWHERE (stock_quantity < 15 OR price >=150.00) 
	AND NOT category = 'stationery';

-- ------------------------------------------------------------------------------
-- 5. Aggregations & Grouping: Stock & Price Auditing by Category
-- Displays total stock and max price for categories where total stock exceeds 50 units.
-- ------------------------------------------------------------------------------
SELECT category,
	SUM(stock_quantity) AS total_stock,
	MAX(price) AS maximum_priceFROM productsWHERE price > 20.00 GROUP BY categoryHAVING SUM(stock_quantity) > 50;

-- ------------------------------------------------------------------------------
-- 6. Exclusions: The "Non-W" Clearance Query
-- Filters out products starting with 'W' and excludes Kitchen/Furniture categories.
-- ------------------------------------------------------------------------------
SELECT
	product_name,
	category,
	priceFROM productsWHERE product_name NOT LIKE 'W%' AND category NOT IN ('Kitchen', 'Furniture')ORDER BY price DESC;

-- ------------------------------------------------------------------------------
-- 7. Targeted Restocking (DML Update)
-- Adds 25 units of stock to under-stocked (< 100) Electronics & Stationery.
-- ------------------------------------------------------------------------------
UPDATE products
	SET stock_quantity = stock_quantity+25WHERE category IN ('Electronics', 'Stationery') AND stock_quantity < 100;

-- ------------------------------------------------------------------------------
-- 8. Pattern Matching Audit: Special Names & Out-of-Bound Prices
-- Finds products with 'and' in their name OR priced outside the $30-$200 range.
-- ------------------------------------------------------------------------------
SELECT *FROM productsWHERE product_name LIKE '%and%' OR price NOT BETWEEN 30.00 AND 200.00;

-- ------------------------------------------------------------------------------
-- 9. Calculated Fields: High Potential Revenue Analysis
-- Calculates inventory value and filters for products worth more than $5000 total.
-- ------------------------------------------------------------------------------
SELECT
	product_name,
	stock_quantity,
	price*stock_quantity AS potential_revenewFROM productsWHERE (price * stock_quantity) > 5000.00ORDER BY potential_revenew DESC;

-- ------------------------------------------------------------------------------
-- 10. Double-Wildcard Filtering: Specific Character Containment
-- Finds product names containing the letter 'e' but completely lacking 'a'.
-- ------------------------------------------------------------------------------
SELECT *FROM productsWHERE product_name LIKE '%e%'
	AND product_name NOT LIKE '%a%';

-- ------------------------------------------------------------------------------
-- 11. Range Math: Non-Middle Tier Inventory Clearance
-- Excludes the middle pricing tier ($20 to $100) for products currently in stock.
-- ------------------------------------------------------------------------------
SELECT *FROM productsWHERE (price NOT BETWEEN 20.00 AND 100.00) AND stock_quantity>0;

-- ------------------------------------------------------------------------------
-- 12. Complex Rules: "Cheap & Plentiful" Promo Filter
-- Selects cheap Stationery (< $15) OR any product with high volume (>= 100 units).
-- ------------------------------------------------------------------------------
SELECT 
	product_name,
	category,
	price,
	stock_quantityFROM productsWHERE (category = 'Stationery' AND price < 15.00) OR stock_quantity >= 100ORDER BY stock_quantity DESC;

-- ------------------------------------------------------------------------------
-- 13. Modulo Math: Pricing Audit for Fractional Cent Values
-- Flags any items whose prices do not cleanly end in .00 or .50.
-- ------------------------------------------------------------------------------
SELECT 
	product_name,
	price,
	price % 1 AS cents_onlyFROM productsWHERE price%1 != 0.00 AND price%1!=0.50;
