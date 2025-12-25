Star Schema Design Documentation – FlexiMart

Section 1: Schema Overview

The data warehouse for FlexiMart is designed using a star schema to support sales analysis and reporting. The central table is a fact table surrounded by multiple dimension tables.

FACT TABLE: fact_sales  
Grain: One row per product per order line item  
Business Process: Sales transactions

Measures (Numeric Facts):
• quantity_sold: Number of units sold  
• unit_price: Price per unit at the time of sale  
• discount_amount: Discount applied on the product  
• total_amount: Final amount calculated as (quantity × unit_price − discount)

Foreign Keys:
• date_key → dim_date  
• product_key → dim_product  
• customer_key → dim_customer  

---

DIMENSION TABLE: dim_date  
Purpose: Supports time-based analysis such as daily, monthly, quarterly, and yearly trends  
Type: Conformed dimension

Attributes:
• date_key (Primary Key): Surrogate key in YYYYMMDD format  
• full_date: Actual calendar date  
• day_of_week: Name of the day (Monday, Tuesday, etc.)  
• month: Month number (1–12)  
• month_name: Month name (January, February, etc.)  
• quarter: Quarter of the year (Q1, Q2, Q3, Q4)  
• year: Year value (2023, 2024, etc.)  
• is_weekend: Indicates whether the date falls on a weekend  

---

DIMENSION TABLE: dim_product  
Purpose: Stores product-related descriptive information

Attributes:
• product_key (Primary Key): Surrogate key  
• product_id: Business product identifier  
• product_name: Name of the product  
• category: Product category  
• brand: Brand name  
• standard_price: Listed price  

---

DIMENSION TABLE: dim_customer  
Purpose: Stores customer-related descriptive information

Attributes:
• customer_key (Primary Key): Surrogate key  
• customer_id: Business customer identifier  
• customer_name: Full name of the customer  
• city: Customer’s city  
• state: Customer’s state  
• country: Customer’s country  

---

Section 2: Design Decisions

The grain of the fact table is defined at the transaction line-item level, meaning each row represents one product in a single order. This level of detail was chosen because it provides maximum analytical flexibility. It allows analysis at the lowest level and supports aggregation to higher levels such as daily sales, monthly revenue, or category-wise performance.

Surrogate keys are used instead of natural keys to improve performance and maintain consistency. Natural keys from source systems may change or be reused, whereas surrogate keys are stable and optimized for joins in a data warehouse environment.

This star schema design supports drill-down and roll-up operations efficiently. Users can drill down from yearly sales to quarterly, monthly, or daily sales using the date dimension. Similarly, roll-up operations can summarize product-level sales to category or brand levels. The simplified structure of the star schema ensures fast query performance and easy reporting.

---

Section 3: Sample Data Flow

Source Transaction:  
Order number 101  
Customer: John Doe  
Product: Laptop  
Quantity: 2  
Unit Price: 50000  

Becomes in the Data Warehouse:

fact_sales:
{
  date_key: 20240115,
  product_key: 5,
  customer_key: 12,
  quantity_sold: 2,
  unit_price: 50000,
  discount_amount: 0,
  total_amount: 100000
}

dim_date:
{
  date_key: 20240115,
  full_date: '2024-01-15',
  day_of_week: 'Monday',
  month: 1,
  month_name: 'January',
  quarter: 'Q1',
  year: 2024,
  is_weekend: false
}

dim_product:
{
  product_key: 5,
  product_name: 'Laptop',
  category: 'Electronics',
  brand: 'Generic'
}

dim_customer:
{
  customer_key: 12,
  customer_name: 'John Doe',
  city: 'Mumbai',
  country: 'India'
}
