Superstore SQL Analysis Project
Overview

This project contains advanced SQL queries performed on the Superstore dataset to analyze sales, profit, customers, regions, discounts, shipping performance, and business trends.

The project focuses on solving real-world business problems using SQL and demonstrates skills in:

Aggregate Functions
GROUP BY & HAVING
ORDER BY & LIMIT
CASE Statements
Common Table Expressions (CTEs)
Window Functions
Ranking Functions
Profitability Analysis
Customer Behavior Analysis
Sales Trend Analysis
Business Intelligence Reporting
Dataset Used

Dataset: Superstore Dataset

The dataset includes information related to:

Orders
Customers
Products
Sales
Profit
Discounts
Regions
Categories
Shipping Modes
SQL Concepts Covered
Basic SQL
SELECT
WHERE
ORDER BY
LIMIT
DISTINCT
Aggregate Functions
SUM()
AVG()
COUNT()
MAX()
MIN()
ROUND()
VARIANCE()
STDDEV()
GROUPING
GROUP BY
HAVING
Conditional Logic
CASE WHEN
Window Functions
RANK()
OVER()
PARTITION BY
Running Average
Advanced SQL
CTEs (WITH Clause)
Self Join
Percentage Contribution Analysis
Profit Margin Calculation
Business Problems Solved

This project answers business questions such as:

Which regions generate the highest sales and profit?
Which products are loss-making?
Which cities and states are most profitable?
What is the impact of discounts on profit?
Who are the top customers by sales?
Which shipping modes are most used?
What are the monthly sales trends?
Which categories perform best in each region?
Example Queries Included
Profit Margin Analysis
SELECT Region,
ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin
FROM superstore
GROUP BY Region
ORDER BY profit_margin DESC;
Top Profitable Products
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
Running Average Sales
SELECT order_date,
ROUND(AVG(sales) OVER(ORDER BY order_date),2)
FROM superstore;
Key Insights Generated
Identified top-performing regions and states
Detected loss-making products and cities
Analyzed customer purchasing behavior
Evaluated discount effectiveness
Compared profitability across categories
Measured regional contribution to total sales
Tools Used
MySQL
SQL Workbench / DB Browser
GitHub
Learning Outcomes

Through this project, I improved my understanding of:

Writing optimized SQL queries
Solving business problems using data
Data aggregation and reporting
Analytical thinking
Business insight generation
Project Structure
superstore-sql-analysis/
│
├── dataset/
│   └── superstore.csv
│
├── queries/
│   └── advanced_sql_queries.sql
│
├── screenshots/
│   └── query_outputs.png
│
└── README.md
Future Improvements
Create dashboards using Power BI or Tableau
Add SQL optimization techniques
Perform predictive analytics
Build KPI reports
Author

Swet Patel

Aspiring Data Analyst / Data Science Enthusiast

GitHub Topics/Tags
sql mysql data-analysis business-analysis data-science sql-project analytics cte window-functions superstore sql-queries
Suggested Commit Message
Added advanced SQL analysis project using Superstore dataset with 50+ business queries and insights
Suggested LinkedIn Caption

Completed an Advanced SQL Analysis Project using the Superstore dataset.

In this project, I solved 50+ business problems using:

Aggregate Functions
CASE Statements
CTEs
Window Functions
Ranking Functions
Profitability Analysis
Customer Insights

The project helped me strengthen my SQL and business analytics skills by converting raw data into meaningful insights.
