📊 E-Commerce Business Intelligence Dashboard

📌 Overview

Is revenue growth enough to guarantee a healthy business?

This project builds an end-to-end Business Intelligence solution using a public e-commerce dataset. The objective is to evaluate sales performance, operational efficiency, and financial risk through structured data modelling and interactive visualisation.

The solution integrates Python (data cleaning), SQL (business logic modelling), and Power BI (interactive analytics).

------------------------------------------------------

🎯 Business Questions

The dashboard is designed to answer:

Is revenue growth aligned with financial stability?

How reliable and efficient are delivery operations?

Is revenue overly concentrated in specific product categories?

Are there hidden risks in receivables and payment collection?

------------------------------------------------------

🧱 Data \& Architecture

📂 Data Source: Ecommerce Order \& Supply Chain Dataset by Aditya Bagus Pratama, available on Kaggle: https://www.kaggle.com/datasets/bytadit/ecommerce-order-dataset


🔄 Data Pipeline

Raw CSV Data

↓

Python (Cleaning \& Standardisation)

↓

SQL Tables

↓

SQL Views (Business Logic Layer)

↓

Power BI (Modelling \& Visualisation)

↓

KPI Validation (Cross-check with SQL)

------------------------------------------------------

📊 Dashboard Sections

1️⃣ Executive Overview

2️⃣ Product Category Insights

3️⃣ Product Detail Insights

4️⃣ Logistics Performance

5️⃣ Financial Health & Risk

------------------------------------------------------

🧮 Key KPI Definitions

Total Revenue – Sum of product prices (excluding shipping)

Total Income - Sum of product prices & shipping fees

Avg Lead Days – Average days from order placement to delivery

On-Time Rate – % delivered on or before estimated date

Underpaid Rate – % of orders where collected < receivable

Outstanding Amount – Receivable − Collected

All KPIs dynamically respond to time, category, and regional filters.

------------------------------------------------------

🚀 Future Improvements

- Profitability analysis (cost data required)

- Customer retention analysis

- Forecasting revenue \& delivery performance

- Payment risk scoring model

