# SQL Data Cleaning — Global Company Layoffs (MySQL)

## 📌 Project Overview
This project performs end-to-end data cleaning on a global company layoffs dataset using MySQL.  
The goal is to transform raw text-based records into a clean, structured, analysis-ready table.

## 🗂️ Dataset
Attributes:
Company, Location, Industry, Total Laid Off, Percentage Laid Off, Date, Stage, Country, Funds Raised.

Files:
- layoffs2026_raw.csv → raw dataset  
- layoffs2026_clean.csv → cleaned dataset  

## 🛠️ Tools
- MySQL  
- MySQL Workbench  

## 🧹 Cleaning Process
- Created staging table to preserve raw data  
- Standardized company names using TRIM  
- Converted date from text to DATE format  
- Converted numeric columns to INT and DECIMAL  
- Replaced empty strings with NULL  
- Filled missing industry values using self-join  
- Removed invalid rows  
- Removed duplicate records using ROW_NUMBER()  

## 💻 SQL Scripts
- schema.sql → table structure  
- data_cleaning.sql → complete cleaning pipeline  

## 📊 Result
Final table `layoffs2026_clean` is fully standardized and ready for analysis or visualization.

---
← Back to Portfolio
https://github.com/bayucp30/Portfolio-Data-Analyst
