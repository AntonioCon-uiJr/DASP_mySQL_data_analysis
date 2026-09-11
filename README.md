# Olist SQL Analysis

## Overview

This project analyzes the **Brazilian E-Commerce Public Dataset by Olist** using SQL to evaluate customer spending, revenue performance, product-category performance, and customer purchasing behavior.

The analysis uses relational e-commerce tables such as customers, orders, order items, order payments, products, and product-category translations. The queries are designed to answer practical business questions and demonstrate SQL techniques used in real-world data analytics.

The analysis covers:
- Customer spending and customer segmentation
- Monthly revenue trends and month-over-month performance
- Revenue by product category
- Top-performing products within each category
- Repeat versus one-time customer behavior
- Revenue contribution of the leading product category

## Business Questions

1. Who are the **top 10 customers by total amount spent**?
2. What is the **monthly revenue trend** across the dataset?
3. What is the **month-over-month change in revenue**?
4. Which **product categories generate the most revenue**?
5. What are the **top 3 products within each category by revenue**?
6. How can customers be segmented into **Low, Medium, and High spending tiers**?
7. How many customers are **repeat buyers versus one-time buyers**?
8. What percentage of **total revenue comes from the top product category**?

## Key Findings

### Revenue Trend
Monthly revenue showed a strong upward trend from **2017 through mid-2018**, increasing from approximately **$137K in January 2017** to more than **$1.15M by April 2018**. Revenue generally remained on an upward trajectory and stabilized above **$1M per month** during much of 2018.

A significant anomaly appears in **September 2018**, when reported revenue dropped to only **$166**, representing a potential data-quality, incomplete-reporting, or business-disruption issue that should be investigated before using the figure for business decisions.

### Month-over-Month Revenue
Revenue experienced several significant month-over-month changes. Growth peaked at **53.27% in November 2017**, followed by a **26.76% decline in December 2017**.

In 2018, revenue was comparatively stable before the dataset showed a sharp **99.98% decline in September 2018**. This extreme movement should be treated as an anomaly rather than immediately interpreted as a genuine business trend.

### Top Revenue Category
**Health & Beauty** was the top revenue-generating product category, generating approximately **$1.4M in revenue** and accounting for **9.22% of total revenue**.

### Customer Behavior
The analysis identified **96,096 unique customers**, of which:
- **2,997** were repeat customers
- **93,099** were first-time buyers

This indicates that the customer base was heavily weighted toward one-time buyers, highlighting an opportunity to improve customer retention and repeat purchasing.

### Customer Spending Segmentation
Customers were divided into three spending tiers using their total spending:
- **Low:** bottom 20%
- **Medium:** middle 60%
- **High:** top 20%

The segmentation was implemented using the SQL `NTILE(5)` window function.

### Product Performance
The analysis ranks the **top three products within each product category by revenue**, using the `ROW_NUMBER()` window function. This provides a category-level view of the products contributing most strongly to revenue.

## Recommendations

1. **Investigate the September 2018 revenue anomaly.**  
   Validate whether the unusually low revenue is caused by incomplete data, reporting issues, or an actual business disruption.

2. **Improve customer retention.**  
   With only **2,997 repeat customers compared with 93,099 first-time buyers**, Olist could focus on retention campaigns, personalized promotions, post-purchase engagement, and incentives for second purchases.

3. **Prioritize high-value customers.**  
   Use the High spending tier to develop targeted loyalty programs and personalized offers designed to protect and increase customer lifetime value.

4. **Leverage Health & Beauty performance.**  
   Since Health & Beauty contributes **9.22% of total revenue**, the category can be evaluated for opportunities to expand product assortment, cross-sell complementary products, and strengthen high-performing products.

5. **Use category-level product rankings for inventory planning.**  
   The top-three product analysis can support decisions around inventory availability, promotions, merchandising, and category management.

6. **Monitor revenue trends continuously.**  
   Monthly revenue and MoM metrics should be incorporated into regular reporting to identify growth opportunities and unusual changes early.

## Tools & Skills

### Tools
- **SQL**
- MySQL-compatible SQL syntax
- Relational e-commerce datasets

### SQL Skills Demonstrated
- `SELECT`, `WHERE`, and `ORDER BY`
- `INNER JOIN`
- `GROUP BY`
- Aggregate functions such as `SUM()`, `COUNT()`, and `ROUND()`
- Date transformation using `DATE_FORMAT()`
- Window functions including:
  - `LAG()`
  - `ROW_NUMBER()`
  - `NTILE()`
- Common Table Expressions (`WITH`)
- Customer segmentation
- Revenue analysis
- Month-over-month analysis
- Ranking products within categories
- Percentage-of-total calculations

## Files

| File | Description |
|---|---|
| `README.md` | Project overview, business questions, findings, recommendations, and technical skills |
| `q1_top10_customers_by_amount_spent.sql` | SQL queries used to answer the business questions Q1 |
| `q2_monthly_revenue_trend.sql` | SQL queries used to answer the business questions Q2 |
| `q3_MoM_change_in_revenue.sql` | SQL queries used to answer the business questions Q3 |
| `q4_top_product_category_by_revenue.sql` | SQL queries used to answer the business questions Q4 |
| `q5_top3_product_in_each_category_by_revenue.sql` | SQL queries used to answer the business questions Q5 |
| `q6_customer_spending_segmentation.sql` | SQL queries used to answer the business questions Q6 |
| `q7_no_of_repeat_customers_vs_one_time_buyers.sql` | SQL queries used to answer the business questions Q7 |
| `q8_top_product_category_by_revenue_pct.sql` | SQL queries used to answer the business questions Q8 |

