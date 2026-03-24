with trips as (
    select
    RIDE_ID,
    RIDEABLE_TYPE,
    DATE(TO_TIMESTAMP(STARTED_AT)) as trip_date,
    START_STATION_ID,
    END_STATION_ID,
    MEMBER_CASUAL,
    TIMESTAMPDIFF(Seconds, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) as trip_duration

    from {{ source('demo', 'bike') }}
    where RIDE_ID != 'ride_id'
)
select * from trips