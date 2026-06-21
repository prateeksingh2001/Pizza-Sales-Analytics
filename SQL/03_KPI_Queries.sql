/*
===============================================================================
Project     : End-to-End Pizza Sales Analytics using SQL & Power BI
Author      : Prateek
Database    : PostgreSQL

Description :
This script calculates the key business performance indicators (KPIs)
used in the Pizza Sales Dashboard.
===============================================================================
*/


/*==============================================================================
KEY PERFORMANCE INDICATORS (KPIs)
==============================================================================*/


-- KPI 1: Total Revenue
SELECT
    ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales;



-- KPI 2: Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales;



-- KPI 3: Average Order Value
SELECT
    ROUND(
        SUM(total_price) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM pizza_sales;



-- KPI 4: Total Pizzas Sold
SELECT
    SUM(quantity) AS total_pizzas_sold
FROM pizza_sales;



-- KPI 5: Average Pizzas Per Order
SELECT
    ROUND(
        SUM(quantity)::NUMERIC /
        COUNT(DISTINCT order_id),
        2
    ) AS average_pizzas_per_order
FROM pizza_sales;