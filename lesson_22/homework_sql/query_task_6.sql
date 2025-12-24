--
--Задание 6.
--Для каждой даты посчитайте количество дней с такой же температурой.

SELECT
    month,
    day,
    temperature,
    count(*) over (PARTITION BY temperature) AS days_count_the_same_temperature
FROM
    weather
GROUP BY
    month,
    day
LIMIT 5;

-- month | day | temperature | days_count_the_same_temperature
-- 4	5	-130	1
-- 4	3	-119	2
-- 4	4	-119	2
-- 1	6	-23	    4
-- 3	4	-23	    4