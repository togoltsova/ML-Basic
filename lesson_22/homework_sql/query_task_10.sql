--
--Задание 10.
--Какое давление было в дни перед дождем?.
WITH win_pressure_preceding AS (SELECT
                                    month,
                                    day,
                                    is_rainy,
                                    lag(pressure) over () AS pressure_preceding
                                FROM
                                    weather)
SELECT
    *
FROM
    win_pressure_preceding
WHERE is_rainy = 1
ORDER BY
    month,
    day
LIMIT 5;


-- month | day | is_rainy | pressure_preceding
-- 1	    2	    1	    4.0
-- 1	    3	    1	    5.5
-- 1	    5	    1	    4.4
-- 1	    6	    1	    5.8
-- 2	    4	    1	    4.7

