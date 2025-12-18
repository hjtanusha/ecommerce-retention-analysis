# ecommerce-retention-analysis
Customer retention and reorder analysis using SQL, Excel, and Power BI
E-Commerce Customer Retention & Behaviour Analysis

Project Overview:
This project analyzes customer ordering and reordering behavior for an e-commerce grocery platform using SQL, Excel, and Power BI. The objective is to understand retention-driven growth, identify high-performing categories and products, and analyze customer behavior patterns to support data-driven business decisions.

Business Objectives:
• Analyze first-time vs repeat customer behavior
• Identify departments and products with high reorder rates
• Understand ordering patterns by time of day
• Evaluate average basket size to measure purchase depth
• Generate actionable insights for retention and engagement

Tools & Technologies:
• Excel - Data cleaning, VLOOKUP, pivot tables
• PostgreSQL - Joins, CTEs, aggregations
• Power BI - DAX, data modeling, dashboards
• GitHub - Project documentation

Dataset:
Instacart Market Basket Analysis dataset with multiple related tables:
• Orders
• Order-Product details
• Products
• Departments

Key Analysis & Insights:
Executive Overview:
• Repeat orders (~3.21M) are over 15× higher than first-time orders (~0.21M), showing retention as the primary growth driver.
• Average basket size is ~10 items per order, indicating strong multi-item purchasing behavior.
Retention Analysis:
• Dairy Eggs has the highest reorder rate, indicating habitual purchasing behavior.
• Raw Veggie Product is the #1 reordered product, making it a key retention-driving SKU.
• Reorders are concentrated around a small set of essential products.
Customer Behavior Analysis:
• Order volume peaks around the 10th hour of the day, highlighting late morning as the most active ordering window.
• Repeat customers contribute consistently across peak hours.

Dashboard Structure
1. Executive Overview  - KPIs and retention split
2. Retention Analysis - Department and product-level reorders
3. Customer Behavior - Time-based ordering patterns 
 

Key Business Takeaways:
• Retention drives the majority of platform growth
• Essential categories contribute disproportionately to repeat purchases
• A small number of products drive most reorders
• Late-morning hours are optimal for engagement strategies


