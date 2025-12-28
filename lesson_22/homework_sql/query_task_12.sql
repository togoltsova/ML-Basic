--
--Задание 12.
--Решите любую из предыдущих задач на оконные функции, не используя оконные функции.
-- НЕ Используя RANK(), посчитайте медиану давления в каждый из месяцев.
-- С четностью управьтесь на свое усмотрение.

WITH weather_pressure_DISTINCT AS (SELECT DISTINCT pressure,
                                                   month,
                                                   (SELECT COUNT(*) AS pressure_rank
                                                    FROM weather weather_2
                                                    WHERE weather_2.pressure <= weather.pressure
                                                      AND weather_2.month = weather.month) AS pressure_rank
                                   FROM weather
                                   GROUP BY pressure, month
                                   ORDER BY month, pressure),
     weather_pressure_rank_max AS (SELECT max(pressure_rank) AS pressure_rank_max
                                   FROM weather_pressure_DISTINCT
                                   GROUP BY month)
SELECT pressure,
       month,
       pressure_rank_max,
       floor(1.0 * pressure_rank_max / 2) AS pressure_rank_median
FROM weather_pressure_DISTINCT,
     weather_pressure_rank_max
WHERE pressure_rank = pressure_rank_median
GROUP BY month
ORDER BY month;


-- pressure | month | pressure_rank_max | pressure_rank_median
-- 5.2	        1	    7	                3.0
-- 5.1	        2	    7	                3.0
-- 5.5	        3	    7	                3.0
-- 5.5	        4	    7	                3.0

