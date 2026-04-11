# Perfume Sales Analysis – BigQuery SQL Project


## Project Overview

This project performs an in depth analysis of **perfume e-commerce sales data** using **Google BigQuery**. The goal is to uncover actionable business insights regarding top brands, perfume types, location performance, pricing strategy, and revenue contribution.

All analysis was done using **Standard SQL** in BigQuery, followed by building an interactive dashboard in **Looker Studio**.

### Key Insights Discovered:
- **Calvin Klein** is the top revenue-generating brand
- **Eau de Parfum (EDP)** is the most popular and highest revenue generating perfume type
- Mid range priced perfumes ($20–$50) drive the majority of revenue
- The average price of a profuct is 40$
- **Hackensack, New Jersey** is the highest revenue location
- Top 10 brands contribute ~45% of total revenue
- Many high-demand perfumes are currently out of stock — strong restocking opportunity

## Technologies Used
- **Google BigQuery** – Data querying & analysis
- **SQL** – All data cleaning, aggregation, CTEs, and window functions

This repository contains all the SQL queries I wrote:

- Sample data exploration
- Overall KPIs (Revenue, Total Sold, Avg Price, Product Count)
- Top 10 brands by product count
- Most sold top 10 brands
- Most used perfume types (EDP dominates)
- Top 10 expensive brands (Creed is the most expensive)
- Top 10 products by revenue ("Escape by Calvin Klein" leads)
- Top 10 revenue making brands (Calvin Klein #1)
- Revenue by location (Hackensack, New Jursey leads)
- Revenue by perfume type
- Best selling perfume type by location (with ranking using CTE + Window function)
- Revenue contribution percentage (Top 10 brands = 45%)
- Price range analysis (Low / Medium / High)
- Availability vs Sales (High demand out of stock items)
- Location wise detailed performance

