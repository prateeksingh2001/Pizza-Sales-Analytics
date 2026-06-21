/*
===============================================================================
Project     : End-to-End Pizza Sales Analytics using SQL & Power BI
Author      : Prateek
Database    : PostgreSQL

Description :
This script evaluates pizza performance based on revenue, order frequency,
and quantity sold. It identifies the best-performing and least-performing
pizza varieties to support business decision-making.
===============================================================================
*/


/*==============================================================================
PRODUCT PERFORMANCE ANALYSIS
==============================================================================*/


-- 1. Top 5 Pizzas by Revenue
SELECT
    pizza_name,
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    total_revenue DESC
LIMIT 5;



-- 2. Bottom 5 Pizzas by Revenue
SELECT
    pizza_name,
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    total_revenue ASC
LIMIT 5;



-- 3. Top 5 Pizzas by Total Orders
SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    total_orders DESC
LIMIT 5;



-- 4. Bottom 5 Pizzas by Total Orders
SELECT
    pizza_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    total_orders ASC
LIMIT 5;



-- 5. Top 5 Pizzas by Quantity Sold
SELECT
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    total_quantity_sold DESC
LIMIT 5;



-- 6. Bottom 5 Pizzas by Quantity Sold
SELECT
    pizza_name,
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales
GROUP BY
    pizza_name
ORDER BY
    total_quantity_sold ASC
LIMIT 5;