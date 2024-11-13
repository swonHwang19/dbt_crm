WITH
o AS (
    SELECT * FROM {{ ref('src_opportunity') }}
),

p AS (
    SELECT * FROM {{ source('crm_data', 'product') }}
)

SELECT
    o.id,
    o.name AS opportunity_name,
    o.stagename,
    o.closedate,
    o.isclosed AS is_closed,
    o.createddate,
    o.productid,
    o.quantity,
    p.name AS product_name,
    p.price AS unit_price

FROM o
LEFT JOIN p 

ON (o.productid = p.id)
