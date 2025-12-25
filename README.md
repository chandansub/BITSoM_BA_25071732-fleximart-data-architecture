FlexiMart Data Architecture Project

Student Name:Chandan G 
Student ID:BITSoM_BA_25071732
Email:gowdac316@gmail.com
Date:December 2025

------------------------------------------------------------------

Project Overview

This project implements an end-to-end data architecture solution for FlexiMart.  
It includes data cleaning and loading using ETL pipelines, NoSQL analysis using MongoDB, and a data warehouse with OLAP analytics to support business decision-making.

------------------------------------------------------------------

Repository Structure

studentID-fleximart-data-architecture/
│
├── part1-database-etl/
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   └── data_quality_report.txt
│
├── part2-nosql/
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
│
├── part3-datawarehouse/
│   ├── star_schema_design.md
│   ├── warehouse_schema.sql
│   ├── warehouse_data.sql
│   └── analytics_queries.sql
│
└── README.md

------------------------------------------------------------------

Technologies Used

- Python 3.x  
- pandas  
- mysql-connector-python  
- MySQL 8.0  
- MongoDB 6.0  

------------------------------------------------------------------

Setup Instructions

Database Setup

Create required databases:

mysql -u root -p -e "CREATE DATABASE fleximart;"
mysql -u root -p -e "CREATE DATABASE fleximart_dw;"

Run ETL pipeline:

python part1-database-etl/etl_pipeline.py

Run business queries:

mysql -u root -p fleximart < part1-database-etl/business_queries.sql

Run data warehouse scripts:

mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_schema.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/warehouse_data.sql
mysql -u root -p fleximart_dw < part3-datawarehouse/analytics_queries.sql

MongoDB Setup

mongosh < part2-nosql/mongodb_operations.js

------------------------------------------------------------------

Key Learnings

This project helped me understand how ETL pipelines clean and load raw data into relational databases.  
I learned how NoSQL databases like MongoDB handle flexible schemas and nested data.  
I also gained hands-on experience in designing a star schema and writing OLAP queries for analytical reporting.

------------------------------------------------------------------

Challenges Faced

1. Handling inconsistent and missing data in CSV files was challenging. This was solved using data cleaning and standardization techniques in Python.  
2. Designing the data warehouse schema required careful selection of grain and surrogate keys, which was resolved by following star schema best practices.

------------------------------------------------------------------

GitHub Submission Guidelines

Repository Structure

studentID-fleximart-data-architecture/
│
├── README.md
├── .gitignore
│
├── data/
│   ├── customers_raw.csv
│   ├── products_raw.csv
│   └── sales_raw.csv
│
├── part1-database-etl/
│   ├── README.md
│   ├── etl_pipeline.py
│   ├── schema_documentation.md
│   ├── business_queries.sql
│   ├── data_quality_report.txt
│   └── requirements.txt
│
├── part2-nosql/
│   ├── README.md
│   ├── nosql_analysis.md
│   ├── mongodb_operations.js
│   └── products_catalog.json
│
└── part3-datawarehouse/
    ├── README.md
    ├── star_schema_design.md
    ├── warehouse_schema.sql
    ├── warehouse_data.sql
    └── analytics_queries.sql

------------------------------------------------------------------

.gitignore Template

__pycache__/
*.pyc
.env
venv/

.vscode/
.idea/

.DS_Store
Thumbs.db

*.db
*.log
*.zip


