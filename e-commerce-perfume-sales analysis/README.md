# E-commerce Perfume Sales Analysis (eBay)

## Project Overview

This project is an end-to-end data analytics pipeline built to analyze perfume sales data scraped from eBay using APIs. It covers the complete workflow from data extraction and cleaning (ETL) to data warehousing in BigQuery and visualization using Looker Studio.

The goal of this project is to derive actionable insights such as top performing brands, revenue distribution, and product type trends.

---

## Tech Stack

* **Python (Pandas, NumPy)** → Data cleaning & transformation
* **Google BigQuery** → Data warehousing & SQL analysis
* **SQL** → Data aggregation and insights
* **Looker Studio** → Dashboard & visualization

---

## Project Workflow

### 1. Data Extraction

* Collected perfume product data from keggle
* Dataset includes attributes such as:

  * Brand
  * Title
  * Price
  * Availability
  * Units sold
  * Last updated timestamp
  * Location
  * Product type

---

### 2. Data Cleaning & Transformation (Python ETL)

## ETL Process Breakdown

### 1. Extract
- Downloaded the dataset using `kagglehub`
- Loaded the women's perfume CSV into a pandas DataFrame

### 2. Transform
- Removed duplicate rows
- Handled missing values (brand, type, available, sold)
- Standardized perfume **Type** by parsing the `title` column (EDP, EDT, Cologne, Mist, etc.)
- Cleaned `priceWithCurrency` into separate `price`, `currency`, and `unit` (`/ea`) columns
- Converted `lastUpdated` to proper datetime and extracted `update_date`
- Lowercased and stripped text fields for consistency

### 3. Load
- Loaded the cleaned DataFrame into **Google BigQuery**
- Table: `perfume_data.cleaned_perfume_data`
- Schema optimized for analysis (FLOAT for price/sold/available, TIMESTAMP for dates, etc.)

---

### 4. Data Analysis (SQL in BigQuery)

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

#### Data Normalization

* Standardized brand names using `UPPER()`
* Handled missing values using `WHERE` filters

---

### 5. Dashboard (Looker Studio)

**[View Full Interactive Dashboard](https://lookerstudio.google.com/reporting/b6aefcb7-dca9-4c27-a820-16b2b89de01a)**


## Key Insights

This project analyzes real-world perfume e-commerce data to answer critical business questions:
- Which brands and perfume types generate the most revenue?
- Which locations are the most profitable?
- What is the relationship between price and sales?
- Which products have high demand but low availability?

**Total Scope**:
- **Total Revenue**: $13.89 Million
- **Total Products Sold**: 489.4K
- **Brands**: 244
- **Product Types**: 8 (EDP dominates)

**Dominant Insights**:
- **Calvin Klein** is the clear revenue leader
- **Eau de Parfum (EDP)** drives 62% of revenue
- Mid-range perfumes ($20–$50) deliver the highest revenue
- **Hackensack, New Jersey** is the top-performing location


---

## Dataset

- **Source**: [Perfume E-Commerce Dataset 2024](https://www.kaggle.com/datasets/kanchana1990/perfume-e-commerce-dataset-2024) on Kaggle
- **Files**: `ebay_womens_perfume.csv` (main file used)
- **Rows**: ~1,000 records (after cleaning: 991)
- **Columns**: Brand, Title, Price, Type, Available, Sold, Item Location, etc.

## Repository Structure

```
├── e-commerce-perfume-sales analysis/ 
├── Data Analysis (SQL)/
├── Dashboard/
└── README.md
```

---


