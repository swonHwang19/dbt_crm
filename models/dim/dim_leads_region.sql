WITH 
l AS (
    SELECT * FROM {{ ref('src_lead') }}
),

p AS (
    SELECT * FROM {{ source('crm_data', 'product') }}
),

s AS (
    SELECT * FROM {{ ref('src_sales') }}
)

SELECT 
    l.id,
    l.full_name,
    l.job,
    l.company,
    l.state,
    p.name AS product_name,
    s.full_name AS sales_rep

FROM l
LEFT JOIN p 
ON l.interested_product = p.id
LEFT JOIN s
ON l.sales_rep = s.id