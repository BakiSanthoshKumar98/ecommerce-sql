
-- ecommerce_analysis.sql

-- 1. Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 2. Top 5 countries with most customers
SELECT country, COUNT(*) AS customer_count
FROM customers
GROUP BY country
ORDER BY customer_count DESC
LIMIT 5;

-- 3. Total revenue generated
SELECT SUM(amount) AS total_revenue FROM payments;

-- 4. Monthly sales trend
SELECT strftime('%Y-%m', order_date) AS month, SUM(amount) AS revenue
FROM orders
JOIN payments ON orders.order_id = payments.order_id
GROUP BY month
ORDER BY month;

-- 5. Top 5 best-selling products
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- 6. Products with low stock (less than 10 units)
SELECT product_id, product_name, stock
FROM products
WHERE stock < 10;

-- 7. Average order value per customer
SELECT c.customer_name, AVG(p.amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id;

-- 8. Create a view for daily revenue
CREATE VIEW daily_revenue AS
SELECT DATE(payment_date) AS day, SUM(amount) AS total
FROM payments
GROUP BY day;

-- 9. Subquery: Customers who made orders worth more than average revenue
SELECT c.customer_id, c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > (
    SELECT AVG(amount) FROM payments
);

-- 10. Using JOINs: Orders with product and customer details
SELECT o.order_id, c.customer_name, p.product_name, oi.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
ORDER BY o.order_id;

-- 11. Indexing for optimization
CREATE INDEX idx_orders_order_date ON orders(order_date);
