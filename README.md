# Superstore SQL Analysis Project

## Overview

This project contains 50+ SQL queries performed on the Superstore dataset to analyze sales, profit, customers, discounts, shipping, regions, and business performance.

The goal of this project is to solve real-world business problems using SQL and generate meaningful business insights from raw data.

---

# Dataset Used

Dataset: Superstore Dataset

The dataset includes:

* Orders
* Customers
* Products
* Sales
* Profit
* Discounts
* Categories
* Regions
* Shipping Details

---

# SQL Concepts Covered

## Basic SQL

* SELECT
* WHERE
* ORDER BY
* LIMIT
* DISTINCT

## Aggregate Functions

* SUM()
* AVG()
* COUNT()
* MAX()
* MIN()
* ROUND()
* VARIANCE()
* STDDEV()

## Grouping & Filtering

* GROUP BY
* HAVING

## Conditional Logic

* CASE WHEN

## Advanced SQL

* CTEs (WITH Clause)
* Self Join
* Window Functions
* Ranking Functions
* Running Average
* Profit Margin Calculation
* Percentage Contribution Analysis

---

# Business Problems Solved

This project answers important business questions such as:

* Which regions generate the highest profit?
* Which products are loss-making?
* Which cities and states perform best?
* What is the impact of discounts on profit?
* Who are the top customers by sales?
* Which shipping modes are most frequently used?
* What are the monthly sales trends?
* Which categories perform best in each region?

---

# Example SQL Queries

## Profit Margin by Region

```sql
SELECT Region,
ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM superstore
GROUP BY Region
ORDER BY profit_margin DESC;
```

## Top 5 Profitable Products

```sql
WITH product_profit AS (
  SELECT product_name,
  ROUND(SUM(profit),2) AS total_profit
  FROM superstore
  GROUP BY product_name
)
SELECT *
FROM (
  SELECT *,
  RANK() OVER (ORDER BY total_profit DESC) AS rnk
  FROM product_profit
) t
WHERE rnk <= 5;
```

## Running Average Sales

```sql
SELECT order_date,
ROUND(AVG(sales) OVER(ORDER BY order_date),2)
FROM superstore;
```

---

# Key Insights

* Identified top-performing regions and states
* Detected loss-making products and cities
* Analyzed customer purchasing behavior
* Evaluated the impact of discounts on profitability
* Compared category-wise sales and profit performance
* Generated business insights using SQL analytics

---

# Tools Used

* MySQL
* SQL Workbench
* GitHub

---

# Project Structure

```text
superstore-sql-analysis/
│
├── dataset/
│   └── superstore.csv
│
├── queries/
│   └── advanced_sql_queries.sql
│
├── screenshots/
│   └── sql_outputs.png
│
└── README.md
```

---

# Learning Outcomes

Through this project, I improved my understanding of:

* Writing advanced SQL queries
* Solving business problems using data
* Data aggregation and reporting
* SQL analytical functions
* Business insight generation

---

# Future Improvements

* Create dashboards using Power BI or Tableau
* Add KPI reporting
* Perform predictive analytics
* Optimize complex SQL queries

---

# Author

Swet Patel

Aspiring Data Analyst | Data Science Enthusiast
