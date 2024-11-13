{{ config(materialized='table') }}

WITH fct_product_sales AS (
    SELECT * 
    FROM {{ ref('dim_product_sales') }}
)

SELECT
    p.name AS product_name,
    SUM(o.quantity) AS total_quantity_sold,
    p.price AS unit_price,
    SUM(total_quantity_sold) * price AS total_revenue

FROM fct_product_sales
GROUP BY p.name
ORDER BY total_revenue DESC;
