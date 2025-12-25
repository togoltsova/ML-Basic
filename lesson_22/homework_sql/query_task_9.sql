--
--Задание 9.
--Для каждой даты посчитайте разницу в температуре с предыдущем днем.
WITH win_temp_preceding AS (SELECT month,
                                 day,
                                 temperature,
                                 coalesce(lag(temperature) over (), 0) AS temp_preceding
                            FROM
                                weather)
SELECT
    *,
    abs(temperature - temp_preceding) AS temp_delta
FROM
    win_temp_preceding
ORDER BY
    month,
    day
LIMIT 5;


-- month | day | temperature | temp_preceding | temp_delta
-- 1	    1	    121	        0	            121
-- 1	    2	    25	        121	            96
-- 1	    3	    73	        25	            48
-- 1	    4	    121     	73	            48
-- 1	    5	    121	        121	            0

