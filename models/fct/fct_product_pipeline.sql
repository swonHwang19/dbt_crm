{{ config(materialized='table') }}

WITH fct_product_sales AS (
    SELECT * 
    FROM {{ ref('dim_product_sales') }}
)

SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * price) AS total_revenue

FROM fct_product_sales
GROUP BY product_name
ORDER BY total_revenue DESC
