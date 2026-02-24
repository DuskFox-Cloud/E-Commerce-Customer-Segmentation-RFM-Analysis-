# E-Commerce Customer Segmentation (RFM Analysis)

**Author:** Suraj Kumar Hembram
**Role:** Data Analyst

## 📌 Project Overview
In the highly competitive e-commerce sector, treating all customers exactly the same is an inefficient use of marketing budgets. This project utilizes **RFM (Recency, Frequency, Monetary) Analysis** to segment a company's customer base into distinct groups based on their purchasing behavior. The goal is to identify high-value "Champions," re-engage "At Risk" customers, and provide actionable, data-driven recommendations to the marketing team.

## 🛠️ Tech Stack & Methodology
This project is broken down into three core phases, demonstrating a complete end-to-end data analytics workflow:
* **Data Cleaning (Python/Pandas):** Handled missing Customer IDs, filtered out order cancellations/returns, engineered a `TotalPrice` feature, and standardized date formats for database compatibility.
* **Data Analysis (SQL / TiDB):** Wrote advanced SQL queries utilizing Common Table Expressions (CTEs), Subqueries, and complex `CASE` statements to dynamically calculate RFM scores and assign customer segments.
* **Data Visualization (Power BI):** Designed an interactive dashboard to visually communicate the distribution of customer segments and their direct impact on total revenue.

## 📊 Key Business Insights & Recommendations
Based on the dashboard analysis, I recommend the following strategic actions:
1. **Retain the 'Champions':** Implement a VIP Loyalty Program offering early access to new stock to maintain their high frequency and high monetary value.
2. **Win Back 'At Risk' Customers:** Deploy targeted "We Miss You" email campaigns with 15-20% discount codes specifically to this segment to re-engage them before they churn to competitors.
3. **Upsell 'Active Customers':** Introduce "Bundle Deals" or minimum spend thresholds for free shipping to increase their Average Order Value (AOV).

## 📂 Repository Contents
* `Part_A_Data_Cleaning.ipynb`: The Jupyter Notebook containing all Python data prep.
* `Part_B_RFM_Queries.sql`: The SQL script used to generate the RFM metrics.
* `Part_C_Dashboard.pbix` / `Part_C.pdf`: The final Power BI dashboard and PDF export.
* `clean_data.csv`: The polished dataset ready for analysis.
