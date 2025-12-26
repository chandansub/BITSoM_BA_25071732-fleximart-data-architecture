-- Query 1: Monthly Sales Drill-Down
-- Business Scenario: Sales drill-down from Year → Quarter → Month

SELECT
    d.year,
    d.quarter,
    d.month_name,
    SUM(f.total_amount) AS total_sales,
    SUM(f.quantity_sold) AS total_quantity
FROM fact_sales f
JOIN dim_date d
    ON f.date_key = d.date_key
WHERE d.year = 2024
GROUP BY d.year, d.quarter, d.month, d.month_name
ORDER BY d.year, d.quarter, d.month;


-- Query 2: Top 10 Products by Revenue
-- Business Scenario: Identify top-performing products by revenue

SELECT
    p.product_name,
    p.category,
    SUM(f.quantity_sold) AS units_sold,
    SUM(f.total_amount) AS revenue,
    ROUND(
        (SUM(f.total_amount) /
         SUM(SUM(f.total_amount)) OVER ()) * 100, 2
    ) AS revenue_percentage
FROM fact_sales f
JOIN dim_product p
    ON f.product_key = p.product_key
GROUP BY p.product_name, p.category
ORDER BY revenue DESC
LIMIT 10;


-- Query 3: Customer Segmentation
-- Business Scenario: Segment customers based on total spending

SELECT
    customer_segment,
    COUNT(customer_key) AS customer_count,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_revenue
FROM (
    SELECT
        c.customer_key,
        CASE
            WHEN SUM(f.total_amount) > 50000 THEN 'High Value'
            WHEN SUM(f.total_amount) BETWEEN 20000 AND 50000 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment,
        SUM(f.total_amount) AS total_spent
    FROM fact_sales f
    JOIN dim_customer c
        ON f.customer_key = c.customer_key
    GROUP BY c.customer_key
) sub
GROUP BY customer_segment;
