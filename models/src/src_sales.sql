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
    isactive = true 
    AND title = '매니저' 
    AND department is not null 
