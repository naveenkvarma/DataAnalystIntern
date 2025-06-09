# SQL Data Analysis Project

## Objective
To perform data analysis on an Ecommerce dataset using SQL queries. This project demonstrates various SQL capabilities such as data selection, filtering, joins, subqueries, aggregation, view creation, and query optimization.

## Tools Used
- RDBMS: MySQL (or PostgreSQL / SQLite)
- Interface: DBeaver / phpMyAdmin / DB Browser

## Dataset Tables
- `Customers(customer_id, name, email, location)`
- `Orders(order_id, customer_id, order_date, total_amount)`
- `OrderItems(order_item_id, order_id, product_id, quantity, price)`
- `Products(product_id, name, category, price)`
- `Payments(payment_id, order_id, payment_method, status)`

## SQL Techniques Demonstrated
- SELECT with WHERE, ORDER BY
- Aggregate functions (SUM, AVG) with GROUP BY
- INNER and LEFT JOINs
- Subqueries
- Creating Views
- Indexing for query optimization

## Outcome
This project helped to build hands-on experience in querying and analyzing structured data using SQL, preparing for real-world applications and technical interviews.

## Deliverables
- `ecommerce_queries.sql`: SQL script with all queries
- `screenshots/`: Output of queries execution
## 📷 Screenshots
(C:\Users\VARMA\Downloads\Elevate Labs_Data Analyst Intern\Task - 4\screenshots/table_records creation.png)
### 🔸 1. Basic Query – Electronics Category Products
(screenshots/electronics_products.png)

### 🔸 2. Grouped Products by Category
(screenshots/group_by_category.png)

### 🔸 3. Customer Orders using INNER JOIN
(screenshots/orders_with_customers.png)

### 🔸 4. Products Above Average Price (Subquery)
(screenshots/above_avg_price_products.png)

### 🔸 5. Revenue by Category (Aggregate Function)
(screenshots/revenue_by_category.png)

### 🔸 6. Customer Order Summary View
(screenshots/customer_order_summary_view.png)

### 🔸 7. Index Created on Orders
(screenshots/create_index_orders.png)

