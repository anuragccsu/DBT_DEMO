with CTE As (
    select
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT
    from {{ source('demo', 'bike') }}
)

select * from CTE