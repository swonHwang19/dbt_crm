{{ config(materialized='table') }}

WITH src_lead AS (
    SELECT * 
    FROM {{ ref('src_lead') }}
)

SELECT 
    state,
    COUNT(*) AS row_count
FROM
    src_lead
GROUP BY
    state
ORDER BY
    row_count DESC