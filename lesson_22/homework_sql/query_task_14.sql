--
--Задание 14.
--Используя RANK(), посчитайте медиану давления в каждый из месяцев.
-- С четностью управьтесь на свое усмотрение.

WITH weather_pressure_rank AS (SELECT month,
                                      pressure,
                                      dense_rank() over (PARTITION BY month ORDER BY pressure) AS pressure_rank
                               FROM weather),
     weather_pressure_rank_max AS (SELECT *,
                                          max(pressure_rank) over (PARTITION BY month) AS pressure_rank_max
                                   FROM weather_pressure_rank)
SELECT DISTINCT pressure,
                month,
                pressure_rank_max,
                floor(1.0 * pressure_rank_max / 2) AS pressure_rank_median
FROM weather_pressure_rank_max
WHERE pressure_rank = pressure_rank_median
ORDER BY month;


-- pressure | month | pressure_rank_max | pressure_rank_median
-- 5.2	        1	    6	                3.0
-- 5.1	        2	    6	                3.0
-- 5.5	        3	    7	                3.0
-- 5.5	        4	    7	                3.0

