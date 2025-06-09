use Naveen;
-- Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    location VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderItems (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Insert Values
INSERT INTO Customers VALUES
(1, 'Amit Sharma', 'amit.sharma@gmail.com', 'Delhi'),
(2, 'Priya Mehta', 'priya.mehta@yahoo.com', 'Mumbai'),
(3, 'John Dsouza', 'john.dsouza@hotmail.com', 'Pune'),
(4, 'Ravi Kumar', 'ravi.kumar@outlook.com', 'Chennai'),
(5, 'Sneha Patil', 'sneha.patil@gmail.com', 'Pune');

INSERT INTO Products VALUES
(101, 'Wireless Mouse', 'Electronics', 499.99),
(102, 'Keyboard', 'Electronics', 899.50),
(103, 'Bluetooth Speaker', 'Electronics', 1299.00),
(104, 'T-Shirt', 'Clothing', 499.00),
(105, 'Notebook', 'Stationery', 89.00);

INSERT INTO Orders VALUES
(1001, 1, '2024-06-01', 1398.99),
(1002, 2, '2024-06-03', 499.00),
(1003, 3, '2024-06-05', 2598.00),
(1004, 5, '2024-06-06', 588.00);

INSERT INTO OrderItems VALUES
(1, 1001, 101, 1, 499.99),
(2, 1001, 102, 1, 899.00),
(3, 1002, 104, 1, 499.00),
(4, 1003, 103, 2, 1299.00),
(5, 1004, 105, 4, 147.00);

INSERT INTO Payments VALUES
(201, 1001, 'Credit Card', 'Completed'),
(202, 1002, 'UPI', 'Completed'),
(203, 1003, 'Net Banking', 'Pending'),
(204, 1004, 'Cash on Delivery', 'Completed');

-- SQL Data Analysis using Ecommerce Dataset

-- 1. Basic SELECT with WHERE and ORDER BY
SELECT name, location FROM Customers WHERE location = 'Pune' ORDER BY name ASC;

-- 2. Aggregate Function with GROUP BY
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC;

-- 3. INNER JOIN Example
SELECT Customers.name, Orders.order_id, Orders.total_amount
FROM Customers
INNER JOIN Orders ON Customers.customer_id = Orders.customer_id;

-- 4. LEFT JOIN with NULL Check
SELECT Customers.name, Orders.order_id
FROM Customers
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id
WHERE Orders.order_id IS NULL;

-- 5. Subquery Example
SELECT name FROM Customers
WHERE customer_id IN (
    SELECT customer_id FROM Orders
    WHERE total_amount > 5000
);

-- 6. Aggregate with JOIN
SELECT Products.category, SUM(OrderItems.quantity * OrderItems.price) AS total_sales
FROM OrderItems
JOIN Products ON OrderItems.product_id = Products.product_id
GROUP BY Products.category;

-- 7. Create a View for High Value Customers
CREATE VIEW high_value_customers AS
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING total_spent > 10000;

-- 8. Create Index for Optimization
CREATE INDEX idx_customer_id ON Orders(customer_id);
