/*
===============================================================================
Project     : End-to-End Pizza Sales Analytics using SQL & Power BI
Author      : Prateek
Database    : PostgreSQL

Description :
Creates the primary table for storing pizza sales transactions.
This table will be used for SQL analysis and Power BI dashboard development.
===============================================================================
*/


/*==============================================================================
TABLE CREATION
==============================================================================*/

CREATE TABLE pizza_sales (

    -- Unique identifier for each pizza sale
    pizza_id INTEGER PRIMARY KEY,

    -- Customer order identifier
    order_id INTEGER NOT NULL,

    -- Internal pizza identifier
    pizza_name_id VARCHAR(50) NOT NULL,

    -- Number of pizzas ordered
    quantity INTEGER NOT NULL,

    -- Order date
    order_date DATE NOT NULL,

    -- Order time
    order_time TIME NOT NULL,

    -- Price of one pizza
    unit_price NUMERIC(10,2) NOT NULL,

    -- Total revenue for the order line
    total_price NUMERIC(10,2) NOT NULL,

    -- Pizza size (S, M, L, XL, XXL)
    pizza_size VARCHAR(10) NOT NULL,

    -- Pizza category (Classic, Chicken, Supreme, Veggie)
    pizza_category VARCHAR(50) NOT NULL,

    -- Ingredients used
    pizza_ingredients TEXT,

    -- Pizza name
    pizza_name VARCHAR(100) NOT NULL

);