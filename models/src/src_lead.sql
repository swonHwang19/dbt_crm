WITH src_lead AS (
    SELECT 
        id,
        first_name,
        last_name,
        CONCAT(first_name, ' ', last_name) AS full_name,
        job,
        company,
        address,
        SUBSTRING(address, LENGTH(address) - 7, 2) AS state,
        interest AS interested_product,
        ownerid AS sales_rep
    FROM {{ source('crm_data', 'leads') }}
)

SELECT 
    id,
    full_name,
    job,
    company,
    state,
    interested_product,
    sales_rep

FROM
    src_lead
