WITH
o AS (
    SELECT * FROM {{ ref('src_opportunity') }}
),

s AS (
    SELECT * FROM {{ ref('src_sales') }}
)

SELECT
    o.id,
    o.name,
    o.stagename,
    o.closedate,
    o.isclosed,
    o.createddate,
    s.full_name,
    s.department

FROM o
LEFT JOIN s 

ON (o.ownerid = s.id)
