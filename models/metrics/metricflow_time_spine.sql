WITH days AS (
    {{ dbt_utils.date_spine('day', "to_date('01/01/2000','mm/dd/yyyy')", "to_date('01/01/2027','mm/dd/yyyy')") }}
),

final AS (
    SELECT date_day::DATE AS date_day
    FROM days
)

SELECT *
FROM final
