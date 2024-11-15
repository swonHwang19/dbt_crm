WITH dim_leads_pipeline AS (
    SELECT * FROM {{ ref('dim_leads_region') }}
)

SELECT 
    sales_rep,
    product_name,
    COUNT(product_name) AS product_count
FROM
    dim_leads_pipeline
GROUP BY
    sales_rep,
    product_name