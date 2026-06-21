/*
===============================================================================
Project     : End-to-End Pizza Sales Analytics using SQL & Power BI
Author      : Prateek
Database    : PostgreSQL

Description :
This script contains advanced business analysis queries to uncover
customer purchasing behavior, sales trends, and product performance
beyond basic KPI reporting.
===============================================================================
*/


/*==============================================================================
ADVANCED BUSINESS ANALYSIS
==============================================================================*/


-- 1. Peak Sales Hours
SELECT
    EXTRACT(HOUR FROM order_time) AS hour_of_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY
    hour_of_day
ORDER BY
    total_orders DESC;



-- 2. Weekday vs Weekend Performance
SELECT
    CASE
        WHEN EXTRACT(DOW FROM order_date) IN (0,6)
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizza_sales
GROUP BY
    day_type;



-- 3. Average Revenue per Order
SELECT
    ROUND(
        AVG(order_total),
        2
    ) AS average_revenue_per_order
FROM
(
    SELECT
        order_id,
        SUM(total_price) AS order_total
    FROM pizza_sales
    GROUP BY order_id
) AS orders;



-- 4. Highest Revenue Generating Pizza Category
SELECT
    pizza_category,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizza_sales
GROUP BY
    pizza_category
ORDER BY
    total_revenue DESC;



-- 5. Best Selling Pizza Size
SELECT
    pizza_size,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY
    pizza_size
ORDER BY
    total_quantity_sold DESC;



-- 6. Monthly Revenue Growth
SELECT
    EXTRACT(MONTH FROM order_date) AS month_number,
    TO_CHAR(order_date,'Mon') AS month,
    ROUND(SUM(total_price),2) AS total_revenue
FROM pizza_sales
GROUP BY
    month_number,
    month
ORDER BY
    month_number;



-- 7. Revenue Contribution by Pizza Category
SELECT
    pizza_category,
    ROUND(
        SUM(total_price),
        2
    ) AS revenue,
    ROUND(
        SUM(total_price) * 100.0 /
        (
            SELECT SUM(total_price)
            FROM pizza_sales
        ),
        2
    ) AS revenue_percentage
FROM pizza_sales
GROUP BY
    pizza_category
ORDER BY
    revenue DESC;



-- 8. Top 3 Pizzas Within Each Category (Window Function)
SELECT
    pizza_category,
    pizza_name,
    total_revenue,
    category_rank
FROM
(
    SELECT
        pizza_category,
        pizza_name,
        ROUND(SUM(total_price),2) AS total_revenue,
        DENSE_RANK() OVER
        (
            PARTITION BY pizza_category
            ORDER BY SUM(total_price) DESC
        ) AS category_rank
    FROM pizza_sales
    GROUP BY
        pizza_category,
        pizza_name
) ranked_pizzas
WHERE category_rank <= 3
ORDER BY
    pizza_category,
    category_rank;



-- 9. Running Monthly Revenue (Window Function)
SELECT
    month,
    total_revenue,
    SUM(total_revenue) OVER
    (
        ORDER BY month_number
    ) AS cumulative_revenue
FROM
(
    SELECT
        EXTRACT(MONTH FROM order_date) AS month_number,
        TO_CHAR(order_date,'Mon') AS month,
        ROUND(SUM(total_price),2) AS total_revenue
    FROM pizza_sales
    GROUP BY
        month_number,
        month
) monthly_sales
ORDER BY
    month_number;



-- 10. Top 10 Highest Revenue Orders
SELECT
    order_id,
    ROUND(SUM(total_price),2) AS order_revenue
FROM pizza_sales
GROUP BY
    order_id
ORDER BY
    order_revenue DESC
LIMIT 10;
