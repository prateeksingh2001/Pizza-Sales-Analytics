# 📖 Data Dictionary

## Dataset Overview

The Pizza Sales dataset contains transaction-level records of pizza orders. Each row represents a single pizza item purchased within a customer order.

---

## Dataset Information

| Attribute          | Details                     |
| ------------------ | --------------------------- |
| Dataset Name       | Pizza Sales Dataset         |
| Domain             | Food & Restaurant Analytics |
| Total Records      | 48,620                      |
| Database           | PostgreSQL                  |
| Visualization Tool | Power BI                    |

---

## Column Definitions

| Column Name         | Data Type | Description                                                                           |
| ------------------- | --------- | ------------------------------------------------------------------------------------- |
| `pizza_id`          | Integer   | Unique identifier for each pizza sale record.                                         |
| `order_id`          | Integer   | Unique identifier for a customer order. Multiple pizzas can belong to the same order. |
| `pizza_name_id`     | Varchar   | Internal identifier assigned to each pizza type.                                      |
| `pizza_name`        | Varchar   | Name of the pizza sold.                                                               |
| `quantity`          | Integer   | Number of pizzas sold in the transaction.                                             |
| `order_date`        | Date      | Date when the order was placed.                                                       |
| `order_time`        | Time      | Time when the order was placed.                                                       |
| `unit_price`        | Numeric   | Selling price of one pizza.                                                           |
| `total_price`       | Numeric   | Total revenue generated for the transaction.                                          |
| `pizza_size`        | Varchar   | Size of the pizza (Small, Medium, Large, X-Large, XX-Large).                          |
| `pizza_category`    | Varchar   | Category of the pizza (Classic, Chicken, Supreme, Veggie).                            |
| `pizza_ingredients` | Text      | Ingredients used in the pizza.                                                        |

---

## Business Metrics Used

The following metrics were calculated during the analysis:

* Total Revenue
* Total Orders
* Average Order Value
* Total Pizzas Sold
* Average Pizzas per Order

---

## Notes

* One order may contain multiple pizzas.
* Revenue is calculated using the `total_price` column.
* Sales trends are analyzed using the `order_date` and `order_time` columns.
* Product performance is evaluated based on revenue, order frequency, and quantity sold.
