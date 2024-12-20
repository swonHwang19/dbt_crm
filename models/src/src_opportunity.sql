WITH src_opportunity AS (
    SELECT * FROM {{ source('crm_data', 'opportunity') }}
)

SELECT 
    id,
    name,
    stagename,
    closedate,
    isclosed,
    ownerid,
    createddate,
    lastmodifieddate,
    productid,
    quantity

FROM
    src_opportunity
