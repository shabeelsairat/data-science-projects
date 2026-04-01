# Perfume E-Commerce Dataset ETL Pipeline

**End-to-End ETL Process** for the **Perfume E-Commerce Dataset 2024** (eBay women's & men's perfumes).

This project demonstrates a complete **Extract, Transform, Load (ETL)** pipeline using Python, pandas, and Google BigQuery.

---

## Project Overview

This ETL pipeline extracts raw perfume sales data from Kaggle, performs data cleaning and transformation, and loads the cleaned dataset into **Google BigQuery** for further analysis or visualization.

### Key Objectives
- Handle missing values and duplicates
- Standardize perfume types (Eau de Parfum, Eau de Toilette, etc.) using title parsing
- Clean price and currency information
- Prepare the data for analytics (EDA, Looker Studio Dashboard)
- Load structured data into a cloud data warehouse (Google Cloud Platform)

---

## Dataset

- **Source**: [Perfume E-Commerce Dataset 2024](https://www.kaggle.com/datasets/kanchana1990/perfume-e-commerce-dataset-2024) on Kaggle
- **Files**: `ebay_womens_perfume.csv` (main file used)
- **Rows**: ~1,000 records (after cleaning: 991)
- **Columns**: Brand, Title, Price, Type, Available, Sold, Item Location, etc.

---

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



