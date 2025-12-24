--
--Задание 8.
--Для каждой даты посчитайте количество дождливых дней с начала года до текущего момента,
-- не учитывая текущий день.

SELECT
    month,
    day,
    is_rainy,
    COALESCE(
            sum(is_rainy) over win,
            0
    ) AS days_count_is_rainy
FROM
    weather
GROUP BY
    month,
    day
WINDOW win AS (ORDER BY month, day ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING)
LIMIT 5;

-- month | day | is_rainy | days_count_is_rainy
-- 1	    1	    0	    0
-- 1	    2	    1	    0
-- 1	    3	    1	    1
-- 1	    4	    0	    2
-- 1	    5	    1	    2

