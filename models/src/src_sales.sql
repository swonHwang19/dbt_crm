WITH src_sales AS (
    SELECT 
        id,
        lastname AS full_name,
        department,
        isactive,
        title
    FROM {{ source('crm_data', 'user') }}
)

SELECT 
    id,
    full_name,
    department

FROM
    src_sales

WHERE
    title IS NOT NULL
    AND department IS NOT NULL;