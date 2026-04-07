-- ============================================================
-- Part 2A: Aggregate Functions
-- ============================================================

-- 1. Count the total number of products.
--    Name the result column total_products.
SELECT COUNT(*) AS total_products
FROM products;

-- 2. Count the number of products in the 'electronics' category.
--    Name the result column electronics_count.
SELECT COUNT(*) AS electronics_count
FROM products
WHERE category = 'electronics';

-- 3. Find the total number of units in stock across all products.
--    Name the result column total_stock.
SELECT SUM(stock) AS total_stock
FROM products;

-- 4. Find the average price across all products.
--    Round to 2 decimal places. Name the result column avg_price.
SELECT ROUND(AVG(price),2) AS avg_price
FROM products;

-- 5. Find the lowest and highest product prices in a single query.
--    Name the columns min_price and max_price.
SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM products;

-- 6. Find the lowest and highest product ratings in a single query.
--    Name the columns min_rating and max_rating.
SELECT MIN(rating) AS min_rating, MAX(rating) AS max_rating
FROM products;

-- 7. Find the total units in stock for the 'sports' category.
--    Name the result column sports_stock.
SELECT SUM(stock) AS sports_stock
FROM products
WHERE category = 'sports';


-- ============================================================
-- Part 2B: GROUP BY
-- ============================================================

-- 8. Count the number of products in each category.
--    Name the count column product_count.
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- 9. Find the average price per category, rounded to 2 decimal places.
--    Name the average column avg_price.
--    Order the results from most expensive to least expensive.
SELECT category, ROUND(AVG(price),2) AS avg_price
FROM products
GROUP BY category
ORDER BY avg_price DESC;

-- 10. Find the total stock per category.
--     Name the total column total_stock.
--     Order from most to least stock.
SELECT category, SUM(stock) AS total_stock
FROM products
GROUP BY category
ORDER BY total_stock DESC;

-- 11. Find the most expensive product price in each category.
--     Name the column max_price. Order by category alphabetically.
SELECT category, MAX(price) AS max_price
FROM products
GROUP BY category
ORDER BY category ASC;

-- 12. Find the average rating per brand, rounded to 2 decimal places.
--     Name the average column avg_rating.
--     Order from highest to lowest average rating.
SELECT brand, ROUND(AVG(rating),2) AS avg_rating
FROM products
GROUP BY brand
ORDER BY avg_rating DESC;

-- 13. Count the number of products per brand.
--     Name the count column product_count.
--     Order by count from highest to lowest.
SELECT brand, COUNT(*) AS product_count
FROM products
GROUP BY brand
ORDER BY product_count DESC;


-- ============================================================
-- Part 2C: HAVING
-- ============================================================

-- 14. Show only categories that have more than 3 products.
--     Name the count column product_count.
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 3;

-- 15. Show only categories where the average price is above $80.
--     Round the average to 2 decimal places. Name it avg_price.
SELECT category, ROUND(AVG(price),2) AS avg_price
FROM products
GROUP BY category
HAVING ROUND(AVG(price),2) > 80;

-- 16. Show only brands with an average rating above 4.5.
--     Round the average to 2 decimal places. Name it avg_rating.
SELECT brand, ROUND(AVG(rating),2) AS avg_rating
FROM products
GROUP BY brand
HAVING ROUND(AVG(rating),2) > 4.5;

-- 17. Among products priced under $150, show categories with
--     an average rating above 4.4.
--     Round the average to 2 decimal places. Name it avg_rating.
SELECT category, ROUND(AVG(rating),2) AS avg_rating
FROM products
WHERE price < 150
GROUP BY category
HAVING ROUND(AVG(rating),2) > 4.4;

-- 18. Show only brands that carry more than one product.
--     Name the count column product_count.
SELECT brand, COUNT(*) AS product_count
FROM products
GROUP BY brand
HAVING COUNT(*) > 1;