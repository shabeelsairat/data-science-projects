# E-commerce Perfume Sales Analysis (eBay) (Project on-going)

## Project Overview

This project is an end-to-end data analytics pipeline built to analyze perfume sales data scraped from eBay. It covers the complete workflow from data extraction and cleaning (ETL) to data warehousing in BigQuery and visualization using Looker Studio.

The goal of this project is to derive actionable insights such as top-performing brands, revenue distribution, and product-type trends.

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

Performed extensive preprocessing using Pandas:

* Handled rows where key availability fields were null
* Converted `lastUpdated` column to proper timestamp format
* Handled missing values (`NaT`, `NaN`) appropriately
* Extracted:

  * `update_date`
  * (Dropped derived columns like month/hour for normalization)
* Standardized product categories using title parsing:

  * Eau de Parfum (EDP)
  * Eau de Toilette (EDT)
* Cleaned and validated price columns
* Removed redundant fields like raw currency strings

---

### 3. Data Loading (BigQuery)

* Loaded cleaned dataset into **Google BigQuery**
* Used explicit schema definitions to ensure correct data types
* Applied `WRITE_TRUNCATE` strategy for controlled updates
* Maintained clean and analysis-ready table structure

---

### 4. Data Analysis (SQL in BigQuery)

Developed analytical queries to answer key business questions:

#### Top Selling Brands

#### Revenue Analysis

* Identified:

  * Top revenue-generating brands
  * Revenue distribution by location
  * Revenue by product type

#### Data Normalization

* Standardized brand names using `UPPER()`
* Handled missing values using `WHERE` filters

---

### 5. Dashboard (Looker Studio)

Built an interactive dashboard to visualize:


## Key Insights

* Certain legacy brands (e.g., Calvin Klein, Versace) dominate sales volume
* Eau de Parfum (EDP) contributes significantly higher revenue compared to EDT
* Revenue distribution varies widely by seller location
* Data inconsistencies (brand casing, type labeling) can significantly affect analysis if not cleaned

---

## Learnings

* Importance of proper data cleaning before analysis
* Handling missing values without introducing bias
* Writing efficient SQL queries using aggregation
* Designing a clean data schema for analytics
* Building end-to-end data pipelines from raw data to dashboard

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


