
# 🛍️ eCommerce SQL Data Analysis

This project uses SQL to perform data analysis on a sample eCommerce database. It covers business insights such as sales trends, customer behavior, product performance, and revenue generation.

## 📦 Tables

- **customers**: customer_id, customer_name, country
- **orders**: order_id, customer_id, order_date, status
- **order_items**: order_item_id, order_id, product_id, quantity, price
- **products**: product_id, product_name, category, stock
- **payments**: payment_id, order_id, amount, payment_date

## 🔍 Analysis Queries

- Total customers, total revenue
- Top countries by customer count
- Monthly sales trend
- Best-selling products
- Products with low stock
- Average order value per customer
- Customer performance vs average revenue
- Multi-table JOINs for detailed views
- Views for reusability
- Indexing for optimization

## 📁 Files

- `ecommerce_analysis.sql`: All SQL queries
- `screenshots/`: Output screenshots for each query
- `README.md`: Project documentation

## 🛠️ Tools

- MySQL / PostgreSQL / SQLite
- DB Browser for SQLite / pgAdmin / MySQL Workbench

## 📷 How to Use

1. Import or create the database using a SQL engine.
2. Run the queries in `ecommerce_analysis.sql`.
3. Capture and store screenshots in the `screenshots/` folder.

---
