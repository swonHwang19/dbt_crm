WITH src_lead AS (
    SELECT 
        id,
        first_name,
        last_name,
        CONCAT(first_name, ' ', last_name) AS full_name,
        job,
        company,
        address,
        SUBSTRING(address, LENGTH(address) - 7, 2) AS state
    FROM {{ source('crm_data', 'lead') }}
)

SELECT 
    id,
    full_name,
    job,
    company,
    state

FROM
    src_lead
