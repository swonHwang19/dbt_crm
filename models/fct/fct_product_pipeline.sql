{{ config(materialized='table') }}

WITH fct_product_sales AS (
    SELECT * 
    FROM {{ ref('dim_product_sales') }}
)

SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold,
    price,
    SUM(quantity * price) AS total_revenue

FROM fct_product_sales
GROUP BY product_name, price
ORDER BY total_revenue DESC
