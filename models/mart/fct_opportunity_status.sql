{{ config(materialized='table') }}

WITH fct_opportunity_status AS (
    SELECT * 
    FROM {{ ref('dim_pipeline') }}
)
SELECT
    full_name,
    COUNT(*) AS total_opportunity_count,
    SUM(CASE WHEN stagename IN ('Closed Won', 'Closed Lost') THEN 1 ELSE 0 END) AS total_closed_count,
    SUM(CASE WHEN stagename = 'Closed Won' THEN 1 ELSE 0 END) AS closed_won_count,
    SUM(CASE WHEN stagename = 'Closed Lost' THEN 1 ELSE 0 END) AS closed_lost_count
    
FROM
    fct_opportunity_status

GROUP BY
    full_name
