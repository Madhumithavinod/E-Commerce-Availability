TOP COSTUMERS

SELECT c.name, SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

MONTHLY REVENUE

SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS revenue
FROM Orders
GROUP BY month;

BEST SELLING PRODUCTS

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

REPEAT CUSTOMERS

SELECT customer_id, COUNT(*) AS order_count
FROM Orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

CATEGORY REVENUE

SELECT p.category, SUM(oi.quantity * oi.price) AS revenue
FROM Order_Items oi
JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.category;

RUNNING TOTAL

SELECT 
    customer_id,
    order_date,
    SUM(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS running_total
FROM Orders;

RANKING

SELECT product_name, total_sold,
RANK() OVER (ORDER BY total_sold DESC) AS rank_pos
FROM (
    SELECT p.product_name, SUM(oi.quantity) AS total_sold
    FROM Order_Items oi
    JOIN Products p ON oi.product_id = p.product_id
    GROUP BY p.product_name
) t;

VIEW

CREATE VIEW customer_summary AS
SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

INDEX

CREATE INDEX idx_customer_id ON Orders(customer_id);

