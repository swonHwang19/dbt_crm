WITH dim_product_pipeline AS (
    SELECT * FROM {{ ref('mart_opportunity') }}
)

SELECT 
    full_name AS sales_rep,
    product_name,
    COUNT(product_name) AS opportunity_product_count
FROM
    dim_product_pipeline
GROUP BY
    sales_rep,
    product_name