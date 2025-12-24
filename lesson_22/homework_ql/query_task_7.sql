--
--Задание 7.
--Для каждой даты посчитайте количество дождливых дней
--с начала года до текущего момента.

SELECT
    month,
    day,
    is_rainy,
    sum(is_rainy) over (ORDER BY month, day) AS days_count_is_rainy
FROM
    weather
GROUP BY
    month,
    day
LIMIT 5;

-- month | day | is_rainy | days_count_is_rainy
-- 1	    1	    0	    0
-- 1	    2	    1	    1
-- 1	    3	    1	    2
-- 1	    4	    0	    2
-- 1	    5	    1	    3
