/*
===============================================================================
Project     : End-to-End Pizza Sales Analytics using SQL & Power BI
Author      : Prateek
Database    : PostgreSQL

Description :
This script analyzes sales trends across time, pizza categories,
and pizza sizes to identify business patterns and customer preferences.
===============================================================================
*/


/*==============================================================================
SALES TREND ANALYSIS
==============================================================================*/


-- 1. Monthly Revenue Trend
SELECT
    EXTRACT(MONTH FROM order_date) AS month_number,
    TO_CHAR(order_date, 'Mon') AS month,
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY
    month_number,
    month
ORDER BY
    month_number;



-- 2. Daily Order Trend
SELECT
    EXTRACT(DOW FROM order_date) AS day_number,
    TRIM(TO_CHAR(order_date, 'Day')) AS day_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY
    day_number,
    day_name
ORDER BY
    day_number;



-- 3. Percentage of Sales by Pizza Category
SELECT
    pizza_category,
    ROUND(
        SUM(total_price) * 100.0 /
        (SELECT SUM(total_price) FROM pizza_sales),
        2
    ) AS sales_percentage
FROM pizza_sales
GROUP BY
    pizza_category
ORDER BY
    sales_percentage DESC;



-- 4. Percentage of Sales by Pizza Size
SELECT
    pizza_size,
    ROUND(
        SUM(total_price) * 100.0 /
        (SELECT SUM(total_price) FROM pizza_sales),
        2
    ) AS sales_percentage
FROM pizza_sales
GROUP BY
    pizza_size
ORDER BY
    sales_percentage DESC;



-- 5. Total Pizzas Sold by Pizza Size
SELECT
    pizza_size,
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY
    pizza_size
ORDER BY
    total_pizzas_sold DESC;



-- 6. Total Pizzas Sold by Pizza Category
SELECT
    pizza_category,
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales
GROUP BY
    pizza_category
ORDER BY
    total_pizzas_sold DESC;


