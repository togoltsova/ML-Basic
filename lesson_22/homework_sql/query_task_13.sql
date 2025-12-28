--
--Задание 13.
--Сколько дней длится сезон дождей на Меркурии?
-- P.S. Сезон дождей = самый длинный период из подряд идущих дождливых дней.
-- P.P.S. Имеются в виду метеоритные дожди.
-- P.P.S.  Можно использовать то, что в месяце – 7 дней.

WITH weather_row_number AS (SELECT month,
                               day,
                               is_rainy,
                               row_number() over () AS row_number
                        FROM weather
                        ORDER BY month, day),
     not_rainy_days AS (SELECT month, day, is_rainy, row_number FROM weather_row_number WHERE is_rainy = 0),
     not_rainy_days_preceding AS (SELECT *,
                                             lag(row_number) over () AS row_number_preceding
                                      FROM not_rainy_days
                                      ORDER BY month, day),
     days_is_rainy_max_period AS (SELECT *,
                                         max(row_number - row_number_preceding) AS days_is_rainy_max
                                  FROM not_rainy_days_preceding)
SELECT
     weather_row_number.month,
     weather_row_number.day,
    (days_is_rainy_max - 1) AS rain_season_days_total
FROM
    weather_row_number,
    days_is_rainy_max_period
WHERE
    weather_row_number.row_number = days_is_rainy_max_period.row_number_preceding + 1     -- rain_season_start
   OR weather_row_number.row_number = days_is_rainy_max_period.row_number - 1               -- rain_season_end
ORDER BY
    weather_row_number.month, weather_row_number.day;

-- month	day	rain_season_days_total
-- 3	    1	    8
-- 4	    1	    8