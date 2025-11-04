-- Create database
CREATE DATABASE grocery_store;
USE grocery_store;

-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Create transactions table
CREATE TABLE transactions (
    transaction_id INT,
    transaction_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (transaction_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert product categories and items
INSERT INTO products (product_id, product_name, category, price) VALUES
-- Dairy Products
(1, 'Milk', 'Dairy', 3.99),
(2, 'Cheese', 'Dairy', 4.50),
(3, 'Yogurt', 'Dairy', 2.99),
(4, 'Butter', 'Dairy', 3.25),
(5, 'Eggs', 'Dairy', 4.99),

-- Bakery
(6, 'Bread', 'Bakery', 2.49),
(7, 'Croissant', 'Bakery', 1.99),
(8, 'Bagel', 'Bakery', 1.25),
(9, 'Muffin', 'Bakery', 2.75),

-- Fruits
(10, 'Banana', 'Fruits', 0.25),
(11, 'Apple', 'Fruits', 0.50),
(12, 'Orange', 'Fruits', 0.75),
(13, 'Strawberry', 'Fruits', 3.99),
(14, 'Grapes', 'Fruits', 4.50),

-- Vegetables
(15, 'Lettuce', 'Vegetables', 1.99),
(16, 'Tomato', 'Vegetables', 0.75),
(17, 'Onion', 'Vegetables', 0.99),
(18, 'Potato', 'Vegetables', 0.30),
(19, 'Carrot', 'Vegetables', 0.45),

-- Meat
(20, 'Chicken Breast', 'Meat', 8.99),
(21, 'Ground Beef', 'Meat', 6.99),
(22, 'Bacon', 'Meat', 5.99),
(23, 'Salmon', 'Meat', 12.99),

-- Beverages
(24, 'Coffee', 'Beverages', 7.99),
(25, 'Tea', 'Beverages', 4.99),
(26, 'Orange Juice', 'Beverages', 3.49),
(27, 'Soda', 'Beverages', 1.99),
(28, 'Beer', 'Beverages', 9.99),

-- Snacks
(29, 'Chips', 'Snacks', 2.99),
(30, 'Chocolate', 'Snacks', 1.99),
(31, 'Cookies', 'Snacks', 3.49),
(32, 'Crackers', 'Snacks', 2.79);

-- Insert transaction data with realistic shopping patterns
INSERT INTO transactions (transaction_id, transaction_date, customer_id, product_id, quantity) VALUES
-- Transaction 1: Breakfast shopping
(1, '2024-01-15', 101, 1, 1),   -- Milk
(1, '2024-01-15', 101, 6, 1),   -- Bread
(1, '2024-01-15', 101, 5, 1),   -- Eggs
(1, '2024-01-15', 101, 24, 1),  -- Coffee
(1, '2024-01-15', 101, 10, 6),  -- Bananas (6)

-- Transaction 2: Sandwich materials
(2, '2024-01-15', 102, 6, 1),   -- Bread
(2, '2024-01-15', 102, 2, 1),   -- Cheese
(2, '2024-01-15', 102, 20, 1),  -- Chicken Breast
(2, '2024-01-15', 102, 16, 3),  -- Tomatoes (3)
(2, '2024-01-15', 102, 15, 1),  -- Lettuce
(2, '2024-01-15', 102, 29, 1),  -- Chips

-- Transaction 3: Party shopping
(3, '2024-01-16', 103, 28, 12), -- Beer (12-pack)
(3, '2024-01-16', 103, 29, 2),  -- Chips (2 bags)
(3, '2024-01-16', 103, 31, 1),  -- Cookies
(3, '2024-01-16', 103, 13, 1),  -- Strawberry
(3, '2024-01-16', 103, 14, 1),  -- Grapes

-- Transaction 4: Family dinner
(4, '2024-01-16', 104, 21, 2),  -- Ground Beef (2 packs)
(4, '2024-01-16', 104, 18, 5),  -- Potatoes (5)
(4, '2024-01-16', 104, 17, 2),  -- Onions (2)
(4, '2024-01-16', 104, 19, 4),  -- Carrots (4)
(4, '2024-01-16', 104, 27, 1),  -- Soda

-- Continue with more transactions to create patterns...
(5, '2024-01-17', 105, 1, 1),   -- Milk
(5, '2024-01-17', 105, 6, 1),   -- Bread
(5, '2024-01-17', 105, 3, 2),   -- Yogurt (2)

(6, '2024-01-17', 106, 5, 1),   -- Eggs
(6, '2024-01-17', 106, 4, 1),   -- Butter
(6, '2024-01-17', 106, 7, 4),   -- Croissants (4)

(7, '2024-01-18', 107, 24, 1),  -- Coffee
(7, '2024-01-18', 107, 30, 2),  -- Chocolate (2)
(7, '2024-01-18', 107, 31, 1),  -- Cookies

(8, '2024-01-18', 108, 1, 1),   -- Milk
(8, '2024-01-18', 108, 5, 1),   -- Eggs
(8, '2024-01-18', 108, 10, 4),  -- Bananas (4)
(8, '2024-01-18', 108, 11, 6),  -- Apples (6)

(9, '2024-01-19', 109, 6, 1),   -- Bread
(9, '2024-01-19', 109, 2, 1),   -- Cheese
(9, '2024-01-19', 109, 22, 1),  -- Bacon

(10, '2024-01-19', 110, 26, 1), -- Orange Juice
(10, '2024-01-19', 110, 7, 6),  -- Croissants (6)
(10, '2024-01-19', 110, 3, 4);  -- Yogurt (4)

-- Add more transactions to create clear patterns for market basket analysis
INSERT INTO transactions (transaction_id, transaction_date, customer_id, product_id, quantity)
SELECT 
    transaction_id + 10,
    DATE_ADD(transaction_date, INTERVAL 1 DAY),
    customer_id + 10,
    product_id,
    quantity
FROM transactions
WHERE transaction_id <= 10;

-- Add some weekend shopping with larger baskets
INSERT INTO transactions (transaction_id, transaction_date, customer_id, product_id, quantity) VALUES
(21, '2024-01-20', 201, 1, 2),   -- Milk (2)
(21, '2024-01-20', 201, 5, 2),   -- Eggs (2)
(21, '2024-01-20', 201, 6, 2),   -- Bread (2)
(21, '2024-01-20', 201, 10, 8),  -- Bananas (8)
(21, '2024-01-20', 201, 11, 6),  -- Apples (6)
(21, '2024-01-20', 201, 15, 1),  -- Lettuce
(21, '2024-01-20', 201, 16, 4),  -- Tomatoes (4)
(21, '2024-01-20', 201, 21, 1),  -- Ground Beef
(21, '2024-01-20', 201, 27, 2),  -- Soda (2)
(21, '2024-01-20', 201, 29, 1);  -- Chips

-- 1. Basic transaction view 
SELECT 
    t.transaction_id,
    p.product_name,
    p.category,
    t.quantity
FROM transactions t
JOIN products p ON t.product_id = p.product_id
ORDER BY t.transaction_id, p.product_name;

-- 2. Most frequently purchased products
SELECT 
    p.product_name,
    p.category,
    COUNT(*) as times_purchased,
    SUM(t.quantity) as total_quantity
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY times_purchased DESC;

-- 3. Products frequently bought together
SELECT 
    p1.product_name as product_A,
    p2.product_name as product_B,
    COUNT(*) as times_bought_together
FROM transactions t1
JOIN transactions t2 ON t1.transaction_id = t2.transaction_id 
    AND t1.product_id < t2.product_id 
JOIN products p1 ON t1.product_id = p1.product_id
JOIN products p2 ON t2.product_id = p2.product_id
GROUP BY p1.product_name, p2.product_name
HAVING times_bought_together >= 2
ORDER BY times_bought_together DESC;

-- 4. Transaction size analysis
SELECT 
    transaction_id,
    COUNT(*) as unique_items,
    SUM(quantity) as total_items,
    ROUND(SUM(p.price * t.quantity), 2) as total_value
FROM transactions t
JOIN products p ON t.product_id = p.product_id
GROUP BY transaction_id
ORDER BY total_value DESC;

-- 5. Export transactions in basket format
SELECT 
    t.transaction_id as invoice,
    p.product_name as item
FROM transactions t
JOIN products p ON t.product_id = p.product_id
ORDER BY t.transaction_id, p.product_name;

-- END OF PROJECT




