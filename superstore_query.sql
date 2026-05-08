use company_db;

/*50 Queries With Question Answer And It's Interpretation*/

-- 1.Select All Data.
SELECT * From superstore;
-- Fetches all columns and all rows from the dataset.

-- 2.Select the first 5 Data.
SELECT * From superstore
Limit 5;
/*
	Shows first 5 records.
	📌 Useful to quickly preview dataset structure
*/

-- 3.Calculates year-wise performance.
SELECT Extract(YEAR FROM STR_TO_DATE(Order_Date,'%m-%d-%Y'))as year,SUM(Sales)as total_sales, SUM(Profit)as total_profit
From superstore
Group By year
Order By year;
/* 
	Shows how business grows yearly,
    Helps identify best/worst year.
*/

-- 4.Compares regions based on profit.
SELECT Region,SUM(sales)as total_sales,SUM(profit)as total_profit
From superstore
Group By Region
Order By total_profit DESC;
/*
	Which region is most profitable,
	Helps in regional strategy decisions.
*/


-- 5.Calculates profit margin for each region in highest to lowest.
SELECT Region,ROUND((SUM(profit)/SUM(sales))*100,2) as profit_margin
From superstore 
Group By Region
Order By profit_margin DESC;
/*
	West region is the most profitable (14.86% margin).
	Central region is the least profitable.
	Even if a region has high sales, its margin could be low if costs are high.
    Helps identify which region is most efficient at generating profit.
    
	->Useful for:
		1.Strategic decisions
		2.Investment focus
		3.Cost optimization
*/

-- 6.Which are the top 10 states generating the highest total profit, and what are their total sales, total profit, and profit margin (%).
SELECT State, ROUND((SUM(profit)/SUM(sales))*100,2) as profit_margin,SUM(sales)as total_sales,SUM(profit)as total_profit
From superstore 
Group By state
order By total_profit DESC
Limit 10;
/*
	->States at the top:
		Generate the highest absolute profit.
		Likely key business markets.
	->A state with:
		High sales + high profit → Strong overall performance.
		High sales + low margin → Selling a lot but less efficiently.
		Lower sales + high margin → Efficient but smaller market.
    
    ->Helps identify:
		Top-performing states driving profit.
		Whether profit comes from high volume or high efficiency.
	->Useful for:
		1.Expansion planning
		2.Marketing focus
		3.Cost control strategies
*/

-- 7.Which 10 states have the lowest total profit, and what are their total sales, total profit, and profit margin (%).
SELECT State,ROUND((SUM(profit)/SUM(sales))*100,2) as profit_margin, SUM(sales)as total_sales, SUM(profit)as total_profit
From superstore 
Group by state
Order by total_profit
Limit 10;
/*
	Helps identify underperforming or loss-making states that need attention
	->Useful for:
		Cost optimization (reduce discounts, shipping, or operational costs)
		Strategy revision (pricing, marketing, product mix)
		Risk management (decide whether to improve or exit certain markets)
	->Important takeaway:
		A state generating high sales is not always profitable
		Focus should be on improving profit margin, not just revenue
*/


-- 8.Which are the top 10 cities generating the highest total profit, and what are their total sales, total profit, and profit margin (%).
SELECT city,ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin,SUM(sales)AS total_sales, SUM(profit)AS total_profit
From superstore 
Group by city 
Order by total_profit DESC
Limit 10;
/*
	->This query identifies the top 10 profit-generating cities and helps businesses understand which urban markets deliver the highest revenue and profitability.
	Helps identify the most profitable cities contributing to business growth
	->Useful for:
		Expanding operations in high-performing cities
		Increasing marketing investment in profitable locations
		Understanding which cities generate the best returns
	->Also helps businesses:
		Compare revenue vs profitability
		Discover whether profits come from large sales volume or efficient operations
*/

-- 9.Which 10 cities have the lowest total profit, and what are their total sales, total profit, and profit margin (%).
SELECT city,ROUND((SUM(profit)/SUM(sales))*100,2)AS profit_margin,SUM(sales)AS total_sales,SUM(profit)AS total_profit
From superstore 
Group by city 
Order by total_profit 
Limit 10;
/*
	->This query highlights the 10 least profitable cities, helping businesses identify problematic markets and make data-driven decisions to improve performance.
	Helps identify loss-making or underperforming cities
	->Useful for:
		Improving pricing or discount strategies
		Reducing operational or shipping costs
		Re-evaluating marketing and sales efforts in weak locations
	->The query also shows that:
		High sales do not always mean high profitability
		Businesses should focus on both sales growth and profit efficiency
*/

-- 10.How does the average sales amount vary across different discount levels in the Superstore dataset.
SELECT discount,AVG(sales)AS avg_sales
FROM superstore 
Group by discount
order by discount;
/*
	->Key observations to look for:
		Higher discounts + higher average sales → discounts may encourage customers to buy more
		Higher discounts + lower average sales → discounts may not be effective
		Very high discounts could sometimes reduce profitability even if sales increase
        
	->Helps businesses understand the relationship between:
		Discount strategy
		Customer purchasing behavior
	->Useful for:
		Optimizing discount offers
		Identifying effective pricing strategies
		Avoiding unnecessary heavy discounts
	->Can help answer questions like:
		“Do discounts actually increase sales?”
		“Which discount range performs best?”
*/

-- 11.Which product categories received the highest total discount in the Superstore dataset.
SELECT category,SUM(discount)AS total_discount
FROM superstore 
Group by category
Order by total_discount DESC;
/*
->Key observations to analyze:
	->A category with a high total discount may have:
		More sales transactions
		Frequent promotional offers
		Aggressive pricing strategies
	->A category with a low total discount may indicate:
		Lower promotional activity
		Strong demand without discounts
	
->Helps businesses understand:
	Which categories rely heavily on discounts to drive sales
	Where promotional spending is concentrated
->Useful for:
	Evaluating discount strategies by category
	Controlling excessive discounting
	Comparing discounts with profitability and sales performance
->Important insight:
	High discounts do not always guarantee high profits
	Businesses should balance sales growth and profitability
*/

-- 12.Which category and sub-category combinations received the highest total discounts.
SELECT category,sub_category,SUM(discount)AS total_discount
FROM superstore 
Group by category,sub_category
Order by total_discount DESC;
/*
	The query calculates the total discount for each category and sub-category combination.
	Results are sorted from highest to lowest discount.
	Sub-categories at the top receive the most discounts.
    
    Helps identify products heavily dependent on discounts.
	Useful for improving pricing and promotional strategies.
	Can reveal whether excessive discounts may be reducing profitability.
*/

-- 13.How do sales and profit vary across different categories in each region.
SELECT region,category,SUM(sales)AS total_sales,SUM(profit)AS total_profit
FROM superstore
Group by region,category
Order by total_profit DESC;
/*
	The query calculates total sales and total profit for each combination of region and category.
	Results are sorted from highest to lowest profit.
	Regions and categories at the top are the most profitable.

->Business Insight
	Helps identify which product categories perform best in each region.
	Useful for regional marketing and inventory planning.
	Can help businesses focus on high-profit category–region combinations.
*/

-- 14.What are the total sales and total profit generated by each product in the Superstore dataset.
SELECT product_name, SUM(sales)AS total_sales,SUM(profit)AS total_profit
FROM superstore
Group by product_name;
/*
	The query calculates total sales and total profit for each product.
	Each row represents the performance of a single product.
	Products with higher sales and profit are stronger performers.

->Business Insight
	Helps identify best-selling and most profitable products.
	Useful for inventory management and product strategy.
	Can reveal products with high sales but low profit margins.
*/

-- 15.Which customer segments generate the highest total sales and total profit.
SELECT segment, SUM(sales)AS total_sales, SUM(profit)AS total_profit
FROM superstore
Group by segment
Order by total_profit DESC;
/*
	The query calculates total sales and total profit for each customer segment.
	Results are sorted from highest to lowest profit.
	Segments at the top are the most profitable customer groups.
->Business Insight
	Helps identify the most valuable customer segments.
	Useful for targeted marketing and customer retention strategies.
	Can help businesses focus more on high-profit customer groups.
*/

-- 16.How many unique customers are present in each region and state combination.
SELECT  COUNT(DISTINCT customerID)AS count_cust
FROM superstore 
Group by region,state;
/*
	The query counts the number of distinct customers for every region and state.
	Each row shows customer presence in a specific state within a region.
	Higher counts indicate areas with a larger customer base.
->Business Insight
	Helps identify regions and states with strong customer reach.
	Useful for market expansion and customer analysis.
	Can help businesses focus on areas with high customer concentration.
*/

-- 17.What are the total sales for each month in the Superstore dataset.
SELECT EXTRACT(MONTH FROM STR_TO_DATE(Order_Date,'%m-%d-%Y'))AS month,
ROUND(SUM(sales),2)AS total_sales
FROM superstore
Group by month
Order by month;
/*
	The query extracts the month from the Order_Date.
	It then calculates the total sales for each month.
	Results are sorted in chronological month order.
->Business Insight
	Helps identify monthly sales trends and seasonal patterns.
	Useful for forecasting, budgeting, and inventory planning.
	Can show peak and low sales months for better business decisions.
*/

-- 18.Which products are generating negative total profit (loss) in the Superstore dataset.
SELECT product_name, ROUND(SUM(profit),2)AS total_profit
FROM superstore
Group by product_name
Having SUM(profit) < 0;
/*
	The query calculates the total profit for each product.
	It only displays products where the total profit is less than 0.
	These products are causing overall losses to the business.

->Business Insight
	Helps identify loss-making products.
	Useful for reviewing pricing, discounts, or operational costs.
	Can support decisions on improving, replacing, or discontinuing unprofitable products.
*/


-- 19.How many orders were shipped through each shipping mode in the Superstore dataset.
SELECT ship_mode, COUNT(*)AS orders
FROM superstore
Group by ship_mode;
/*
	The query counts the total number of orders for each shipping mode.
	Each row represents a different shipping method.
	Higher counts indicate the most frequently used shipping modes.

->Business Insight
	Helps understand customer shipping preferences.
	Useful for logistics and delivery planning.
	Can help businesses optimize shipping costs and service efficiency.
*/

-- 20.How can products be classified based on their profit values as High Profit, Low Profit, or Loss.
SELECT product_name,
CASE
 WHEN profit > 100 THEN 'High Profit'
 WHEN profit > 0 THEN 'Low Profit'
 ELSE 'Loss'
END AS profit_type
FROM superstore;
/*
	The query categorizes each product according to its profit value:
	High Profit → profit greater than 100
	Low Profit → profit greater than 0 but less than or equal to 100
	Loss → profit less than or equal to 0
	Each product is assigned a profit category using the CASE statement.

->Business Insight
	Helps quickly identify profitable and loss-making products.
	Useful for product performance analysis and decision-making.
	Can help businesses focus on high-profit products and improve weak-performing ones.
*/

-- 21.How can products be ranked based on their total sales in the Superstore dataset.
SELECT product_name,
SUM(sales),
RANK() OVER(Order by SUM(sales) DESC)
FROM superstore
Group by product_name;
/*
	The query calculates the total sales for each product.
	It then assigns a rank based on sales in descending order.
	Products with the highest sales receive the top ranks.

->Business Insight
	Helps identify top-selling products.
	Useful for sales analysis and inventory planning.
	Can help businesses focus on products driving the most revenue.
*/


-- 22.How are states ranked by sales within each region in the Superstore dataset.
SELECT state,
RANK() OVER(PARTITION by region Order by sales DESC)
FROM superstore;
/*
	The query ranks states separately within each region based on sales.
	PARTITION BY region creates rankings for every region independently.
	States with higher sales get better ranks within their region.

->Business Insight
	Helps identify top-performing states in each region.
	Useful for regional performance comparison.
	Can support region-wise sales and marketing strategies.
*/

-- 23.What is the time gap between consecutive orders placed by the same customer in the Superstore dataset.
SELECT 
    a.customer_id,
    a.order_date AS current_order,
    b.order_date AS previous_order,
    a.order_date - b.order_date AS days_gap,
    a.sales
FROM superstore a
JOIN superstore b
    ON a.customer_id = b.customer_id
WHERE a.order_date > b.order_date
ORDER BY a.customer_id, a.order_date;
/*
	The query compares orders made by the same customer using a self join.
	It shows:
		Current order date
		Previous order date
		Number of days between the two orders
		Sales amount of the current order
		Larger days_gap values indicate customers ordering less frequently.

->Business Insight
	Helps analyze customer purchasing behavior and repeat order patterns.
	Useful for customer retention and re-engagement strategies.
	Can help identify loyal customers and inactive customers.
*/

-- 24.Which are the top 3 most profitable states in each region.
SELECT *
FROM (
SELECT region, state, SUM(profit),
RANK() OVER (PARTITION BY region ORDER BY SUM(profit) DESC) rnk
FROM superstore
GROUP BY region, state
) t
WHERE rnk <= 3;
/*
	The query calculates total profit for each state within every region.
	It ranks states inside each region based on profit.
	Only the top 3 ranked states from each region are displayed.

->Business Insight
	Helps identify the best-performing states in every region.
	Useful for regional strategy and investment decisions.
	Can help businesses focus on markets generating the highest profits.
*/

-- 25.Which are the top 5 most profitable products in the Superstore dataset.
WITH product_profit AS (
  SELECT product_name, ROUND(SUM(profit),2) AS total_profit
  FROM superstore
  GROUP BY product_name
)
SELECT *
FROM (
  SELECT *, RANK() OVER (ORDER BY total_profit DESC) AS rnk
  FROM product_profit
) t
WHERE rnk <= 5;
/*
	The CTE first calculates total profit for each product.
	Products are then ranked based on profit in descending order.
	Only the top 5 highest-profit products are displayed.

->Business Insight
	Helps identify products contributing the most profit.
	Useful for product strategy and inventory planning.
	Can help businesses focus on high-performing products for growth.
*/

-- 26.Which are the top 5 products generating the highest losses in the Superstore dataset.
WITH loss_products AS (
  SELECT product_name, ROUND(SUM(profit),2) AS total_loss
  FROM superstore
  GROUP BY product_name
)
SELECT *
FROM loss_products
ORDER BY total_loss ASC
LIMIT 5;
/*
	The CTE calculates total profit/loss for each product.
	Results are sorted in ascending order of profit.
	Products at the top have the largest negative profit (highest losses).

->Business Insight
	Helps identify the most loss-making products.
	Useful for reviewing pricing, discounts, and operational costs.
	Can support decisions to improve or discontinue unprofitable products.
*/

-- 27.What percentage contribution does each region make to the total sales of the Superstore business.
SELECT region,
SUM(sales) AS total_sales,
ROUND(SUM(sales) * 100.0 / SUM(SUM(sales)) OVER(),2) AS contribution_pct
FROM superstore
GROUP BY region;
/*
	The query calculates total sales for each region.
	It then computes each region’s percentage contribution to overall sales.
	Higher percentages indicate regions contributing more revenue to the business.

->Business Insight
	Helps identify the most important revenue-generating regions.
	Useful for regional performance analysis and resource allocation.
	Can help businesses focus investments on high-contributing regions.
*/

-- 28.Which are the top 5 most profitable cities in each region.
WITH ranked_cities AS (
    SELECT 
        region,
        city,
        SUM(profit) AS total_profit,
        RANK() OVER (
            PARTITION BY region 
            ORDER BY SUM(profit) DESC
        ) AS rank_in_region
    FROM superstore
    GROUP BY region, city
)
SELECT *
FROM ranked_cities
WHERE rank_in_region <= 5;
/*
	The CTE calculates total profit for each city within every region.
	Cities are ranked separately inside each region based on profit.
	Only the top 5 profitable cities from each region are displayed.

->Business Insight
	Helps identify the strongest-performing cities in every region.
	Useful for regional sales and expansion strategies.
	Can help businesses focus on cities generating the highest profits.
*/

-- 29.Which product category generates the highest profit in each region.
WITH cat_profit AS (
SELECT region, category, ROUND(SUM(profit),2) AS total_profit
FROM superstore
GROUP BY region, category
)
SELECT *
FROM (
  SELECT *, RANK() OVER (PARTITION BY region ORDER BY total_profit DESC) rnk
  FROM cat_profit
) t
WHERE rnk = 1;
/*
	The CTE calculates total profit for each category within every region.
	Categories are ranked by profit inside each region.
	Only the highest-profit category (rnk = 1) from each region is displayed.

->Business Insight
	Helps identify the best-performing category in each region.
	Useful for regional product and marketing strategies.
	Can help businesses prioritize categories driving maximum profit.
*/

-- 30.How does total profit vary across different discount categories such as No Discount, Low Discount, and High Discount.
SELECT 
CASE 
 WHEN discount = 0 THEN 'No Discount'
 WHEN discount <= 0.2 THEN 'Low'
 ELSE 'High'
END As Discount_Type,
ROUND(SUM(profit),2)As Total_Profit
FROM superstore
GROUP BY 1;
/*
	->The query groups orders into discount categories:
		No Discount → discount = 0
		Low → discount up to 0.2
		High → discount greater than 0.2
	It then calculates total profit for each discount type.
	This helps compare profitability across discount strategies.

->Business Insight
	Helps understand the impact of discounts on profit.
	Useful for optimizing discount and pricing strategies.
	Can reveal whether high discounts are reducing profitability.
*/

-- 31.What are the total sales, total profit, and total orders for each sub-category
SELECT 
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders
FROM superstore
GROUP BY sub_category
ORDER BY total_profit DESC;
/*
	Shows performance metrics for each sub-category.
	Higher profit indicates stronger-performing products.
	Higher orders indicate popular sub-categories.

->Business Insight
	Helps identify profitable and high-demand sub-categories.
	Useful for inventory and product strategy.
*/


-- 32.What percentage contribution does each state make to total profit.
SELECT 
    state,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) * 100.0 / SUM(SUM(profit)) OVER (), 2
    ) AS contribution_pct
FROM superstore
GROUP BY state
ORDER BY contribution_pct DESC;
/*
	Calculates total profit and contribution percentage by state.
	Higher percentages indicate stronger profit contribution.

->Business Insight
	Helps identify key profit-generating states.
	Useful for regional business planning.
*/

-- 33.Which orders contain more than one item.
SELECT 
    order_id,
    COUNT(*) AS count_orders,
    ROUND(SUM(sales),2) AS total_sales
FROM superstore
GROUP BY order_id
HAVING COUNT(*) > 1
ORDER BY count_orders DESC;
/*
	Displays orders having multiple records/items.
	Higher counts indicate larger orders.

->Business Insight
	Helps analyze customer purchasing behavior.
	Useful for bundle and cross-selling analysis.
*/

-- 34.Which orders generated total sales greater than 1000.
SELECT 
    order_id,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(*) AS total_items
FROM superstore
GROUP BY order_id
HAVING SUM(sales) > 1000
ORDER BY total_sales DESC;
/*
	How to Interpret the Results
	Shows high-value orders with sales, profit, and item count.	
	Orders at the top have the highest sales.

->Business Insight
	Helps identify premium customers and bulk purchases.
	Useful for targeted marketing strategies.
*/

-- 35.Who is the highest-spending customer in each region.
WITH cust_sales AS (
    SELECT 
        region,
        customer_id,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY region, customer_id
)
SELECT 
    region,
    customer_id,
    total_sales
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY region ORDER BY total_sales DESC) AS rnk
    FROM cust_sales
) t
WHERE rnk = 1;
/*
	Ranks customers within each region by sales.
	Only top-ranked customers are shown.

->Business Insight
	Helps identify most valuable regional customers.
	Useful for customer retention strategies.
*/

-- 36.How do average discount, total profit, and total orders vary by category.
SELECT 
    category,
    ROUND(AVG(discount), 2) AS avg_discount,
    SUM(profit) AS total_profit,
    COUNT(order_id) AS total_orders
FROM superstore
GROUP BY category
ORDER BY avg_discount DESC;
/*
	Shows discount and profit trends by category.
	Higher discounts may reduce profitability.

->Business Insight
	Helps evaluate category-level pricing strategies.
	Useful for balancing discounts and profits.
*/

-- 37.Which customers placed the highest number of orders.
SELECT 
    customer_id,
    customer_name,
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_spent
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_orders DESC
LIMIT 10;
/*
	Shows total orders and spending per customer.
	Top customers are frequent buyers.

->Business Insight
	Helps identify loyal and high-value customers.
	Useful for customer engagement programs.
*/


-- 38.What are the average, minimum, and maximum order values.
WITH order_totals AS (
    SELECT 
        order_id,
        SUM(sales) AS total_order_value
    FROM superstore
    GROUP BY order_id
)
SELECT 
    AVG(total_order_value) AS avg_order_value,
    MIN(total_order_value) AS min_order,
    MAX(total_order_value) AS max_order
FROM order_totals;
/*
	Calculates order value statistics.
	Helps understand order size distribution.

->Business Insight
	Useful for pricing and sales performance analysis.
	Helps identify customer purchasing patterns.
*/

-- 39.Which are the two least profitable cities in each region.
WITH city_profit AS (
    SELECT 
        region,
        city,
        SUM(profit) AS total_profit
    FROM superstore
    GROUP BY region, city
)
SELECT 
    region,
    city,
    total_profit
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY region ORDER BY total_profit ASC) AS rnk
    FROM city_profit
) t
WHERE rnk <= 2;
/*
	Ranks cities by lowest profit within each region.
	Cities shown are weak-performing markets.

->Business Insight
	Helps identify loss-making cities.
	Useful for corrective business strategies.
*/


-- 40.What is the profit percentage for each order.
SELECT 
    order_id,
    SUM(sales),
    SUM(profit),
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_percentage
FROM superstore
GROUP BY order_id
ORDER BY profit_percentage DESC;
/*
	Calculates profit margin percentage per order.
	Higher percentages indicate more profitable orders.

->Business Insight
	Helps evaluate order-level profitability.
	Useful for pricing and discount optimization.
*/


-- 41.How can orders be classified based on sales amount.
SELECT 
    order_id,
    sales,
    CASE
        WHEN sales < 100 THEN 'Low Sales'
        WHEN sales BETWEEN 100 AND 500 THEN 'Medium Sales'
        ELSE 'High Sales'
    END AS sales_category
FROM superstore
ORDER BY sales DESC;
/*
	Categorizes sales into Low, Medium, and High.
	Helps compare different sales levels.

->Business Insight
	Useful for customer segmentation and sales analysis.
	Helps identify high-value transactions.
*/

-- 42.What is the square root value of sales for each order.
SELECT 
    order_id,
    sales,
    ROUND(SQRT(sales), 2) AS sqrt_sales,
    profit
FROM superstore
ORDER BY sales DESC;
/*
	Applies mathematical transformation to sales values.
	Useful for statistical analysis.

->Business Insight
	Helps in advanced analytics and normalization techniques.
*/

-- 43.What are the highest, lowest, and average profits for each category.
SELECT 
    category,
    MAX(profit) AS highest_profit,
    MIN(profit) AS lowest_profit,
    AVG(profit) AS average_profit
FROM superstore
GROUP BY category
ORDER BY highest_profit DESC;
/*
	Shows profit distribution within categories.
	Helps compare category performance.

->Business Insight
	Useful for identifying stable and profitable categories.
*/

-- 44.How do average discount and total sales vary across regions.
SELECT 
    region,
    ROUND(AVG(discount), 2) AS avg_discount,
    SUM(sales) AS total_sales
FROM superstore
GROUP BY region
ORDER BY avg_discount DESC;
/*
	Shows relationship between discounts and sales by region.
	Higher discounts may influence sales volume.

->Business Insight
	Helps optimize regional discount strategies.
*/

-- 45.How can orders be classified based on profitability.
SELECT 
    order_id,
    sales,
    profit,
    CASE
        WHEN profit > 200 THEN 'Highly Profitable'
        WHEN profit > 0 THEN 'Profitable'
        ELSE 'Loss'
    END AS profit_status
FROM superstore
ORDER BY profit DESC;
/*
	Categorizes orders as Highly Profitable, Profitable, or Loss.
	Helps quickly identify performance levels.

->Business Insight
	Useful for profitability analysis and decision-making.
*/


-- 46.How do profit and sales vary across different discount levels.
SELECT 
    discount,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(AVG(sales), 2) AS avg_sales
FROM superstore
GROUP BY discount
ORDER BY discount;
/*
	Shows average profit and sales for each discount value.
	Helps understand discount effectiveness.

->Business Insight
	Useful for optimizing promotional strategies.
*/


-- 47.What are the total orders, sales, and average profit for each customer.
SELECT 
    customer_name,
    COUNT(order_id) AS total_orders,
    SUM(sales) AS total_sales,
    AVG(profit) AS avg_profit
FROM superstore
GROUP BY customer_name
ORDER BY total_orders DESC;
/*
	Displays customer purchase behavior and spending.
	Frequent buyers appear at the top.

->Business Insight
	Helps identify valuable customers.
	Useful for loyalty and retention strategies.
*/

-- 48.What are the variance, standard deviation, and average of sales.
SELECT 
    ROUND(VARIANCE(sales),2) AS sales_variance,
    ROUND(STDDEV(sales),2) AS sales_stddev,
    ROUND(AVG(sales),2) AS avg_sales
FROM superstore;
/*
	Measures sales variability and spread.
	Higher variance means sales are more inconsistent.

->Business Insight
	Useful for forecasting and risk analysis.
*/

-- 49.How many records fall into Loss, Low Profit, and High Profit categories.
SELECT 
CASE
WHEN profit<0 THEN 'Loss'
WHEN profit<=100 THEN 'Low Profit'
ELSE 'High Profit'
END,
COUNT(*),
SUM(sales)
FROM superstore
GROUP BY 1;
/*
	Groups data by profit category.
	Shows count and total sales for each group.

->Business Insight
	Helps understand overall business profitability distribution.
*/

-- 50.What is the running average of sales over time based on order date.
SELECT order_date,
ROUND(AVG(sales) OVER(ORDER BY order_date),2)
FROM superstore;
/*
	Calculates cumulative average sales by date.
	Helps observe long-term sales trends.

->Business Insight
	Useful for trend analysis and sales forecasting.
*/