CREATE DATABASE Bike_Data

WITH cte AS (
    SELECT * FROM dbo.bike_share_2021
    UNION  -- Removes duplicates
    SELECT * FROM dbo.bike_share_2022
)

SELECT cte.dteday, cte.season, cte.yr, cte.weekday, cte.hr, cte.rider_type, riders, price, COGS, price*riders AS revenue, price*riders - COGS*riders AS profit 
FROM cte
LEFT JOIN dbo.cost_table ON cte.yr = dbo.cost_table.yr
