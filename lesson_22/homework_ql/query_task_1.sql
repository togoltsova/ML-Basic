--
--Задание 1.
--Изучите структуру таблицы любыми способами
-- Какой перепад температур наблюдается на Меркурии?

SELECT
    *
FROM
    weather
LIMIT 5;
-- month | day | temperature | pressure | is_rainy
-- 1	121	    4        .0	    0
-- 1	2	    25	    5.5	    1
-- 1	3	    73	    5.4	    1
-- 1	4	    121	    4.4	    0
-- 1	5	    121	    5.8	    1

-- Получите всю метаинформацию о столбцах.
PRAGMA
    table_info(weather);
-- name | type | notnull
-- month	    INTEGER	    0
-- day	        INTEGER	    0
-- temperature	INTEGER	    0
-- pressure	    double	    0
-- is_rainy	    INTEGER	    0

-- Count of columns
SELECT
    count(*)
FROM
    pragma_table_info('weather');
-- count(*)
-- 5

-- Count of rows
SELECT
    count(*)
FROM
    weather;
-- count(*)
-- 28

-- Соберем некоторую статистику по столбцам
SELECT
    min(month) AS month_min,
    max(month) AS month_max,
    min(temperature) AS temp_min,
    avg(temperature) AS temp_avg,
    max(temperature) AS temp_max,
    min(pressure) AS pressure_min,
    avg(pressure) AS pressure_avg,
    max(pressure) AS pressure_max
FROM
    weather;
-- month_min | month_max | temp_min | temp_avg | temp_max | pressure_min | pressure_avg | pressure_max
-- 1	4	-130	62.32142857142857	345	4.0	5.417857142857143	6.1

-- Какой перепад температур наблюдается на Меркурии?
SELECT
    min(temperature) AS temp_min,
    max(temperature) AS temp_max
FROM
    weather;

-- temp_min | temp_max
-- -130	    345