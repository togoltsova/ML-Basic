--
--Задание 5.
--Для каждой даты посчитайте отклонение от средней температуры (арифм.) в этом месяце.
-- Необходимо учесть знак: когда температура меньше ср.ар., она должна быть отрицательной.

WITH win_temp_deviation AS (SELECT month,
                                 day,
                                 temperature,
                                 avg(temperature) over() AS temp_avg
                            FROM
                                weather)
SELECT
    *,
    temperature - temp_avg AS temp_deviation
FROM
    win_temp_deviation
ORDER BY
    month,
    day
LIMIT 5;

-- month | day | temperature | temp_avg | temp_deviation
-- 1	1	    121	    62.32142857142857	58.67857142857143
-- 1	2	    25	    62.32142857142857	-37.32142857142857
-- 1	3	    73	    62.32142857142857	10.67857142857143
-- 1	4	    121	    62.32142857142857	58.67857142857143
-- 1	5	    121	    62.32142857142857	58.67857142857143