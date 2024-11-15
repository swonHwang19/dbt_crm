{{ config(materialized='table') }}

WITH
p AS (
    SELECT * FROM {{ ref('dim_pipeline') }}
),

s AS (
    SELECT * FROM {{ ref('dim_product_sales') }}
)

SELECT
    p.id,
    p.name AS opportunity_name,
    p.stagename,
    p.closedate,
    p.is_closed,
    p.createddate,
    p.full_name,
    p.department,
    s.product_name,
    s.quantity,
    s.price * s.quantity AS total_price

FROM p
LEFT JOIN s
ON (p.id = s.id)