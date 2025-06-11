CREATE DATABASE dbms;
use dbms

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    product_id INT,
    customer_id INT
);

INSERT INTO orders (order_id, order_date, amount, product_id, customer_id) VALUES
(1, '2022-01-05', 100.50, 101, 1001),
(2, '2022-02-01', 75.25, 102, 1002),
(3, '2022-05-18', 150.00, 103, 1003),
(4, '2022-08-12', 200.75, 101, 1001),
(5, '2022-02-10', 50.00, 104, 1004),
(6, '2022-02-18', 125.60, 102, 1002),
(7, '2022-03-09', 300.25, 105, 1005),
(8, '2022-03-11', 175.40, 103, 1003),
(9, '2022-03-20', 90.75, 101, 1001),
(10, '2022-06-05', 225.00, 104, 1004),
(11, '2022-09-15', 110.50, 102, 1002),
(12, '2022-04-22', 85.25, 105, 1005),
(13, '2022-05-03', 150.75, 103, 1003),
(14, '2022-05-10', 200.00, 101, 1001),
(15, '2022-05-18', 125.50, 104, 1004),
(16, '2022-06-05', 75.25, 102, 1002),
(17, '2022-06-12', 300.00, 105, 1005),
(18, '2022-06-20', 175.75, 103, 1003),
(19, '2022-07-03', 225.50, 101, 1001),
(20, '2022-07-15', 100.25, 104, 1004);

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year ASC,
    month ASC;



