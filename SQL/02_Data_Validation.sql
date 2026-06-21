/*
===============================================================================
Project : Pizza Sales Analytics

Author  : Prateek Pratap Singh

Description:
Data validation queries used before performing business analysis.

===============================================================================
*/


/*==============================================================================
DATA VALIDATION
==============================================================================*/

-- View complete dataset
SELECT *
FROM pizza_sales;


-- Preview first 10 records
SELECT *
FROM pizza_sales
LIMIT 10;


-- Count total number of records
SELECT COUNT(*)
FROM pizza_sales;


-- Check for duplicate Pizza IDs
SELECT
    pizza_id,
    COUNT(*) AS duplicate_count
FROM pizza_sales
GROUP BY pizza_id
HAVING COUNT(*) > 1;