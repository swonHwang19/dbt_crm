{{ config(materialized='table') }}

WITH
lp AS (
    SELECT * FROM {{ ref('dim_leads_pipeline') }}
),

pp AS (
    SELECT * FROM {{ ref('dim_product_pipeline') }}
)

SELECT
    COALESCE(lp.sales_rep, pp.sales_rep) AS sales_rep,
    COALESCE(lp.product_name, pp.product_name) AS product_name,
    COALESCE(lp.product_count, 0) AS leads_product_count,
    COALESCE(pp.opportunity_product_count, 0) AS opportunity_product_count,
    COALESCE(lp.product_count, 0) + COALESCE(pp.opportunity_product_count, 0) AS total_product_count
FROM
    lp
FULL OUTER JOIN
    pp
ON
    lp.sales_rep = pp.sales_rep
    AND lp.product_name = pp.product_name
