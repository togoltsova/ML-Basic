--
--Задание 3.
--Какой день был самым жарким?
-- Необходимо обойтись лишь одним запросом (возможно, с подзапросами)


-- only one record
SELECT
   month,
   day,
   temperature AS temp_max
FROM
   weather
ORDER BY temperature DESC
LIMIT 1;
-- month | day | temp_max
-- 4	7	345

-- all records with temperature = max temperature
WITH temp_maximum AS (
    SELECT
        MAX(temperature) AS t_max
    FROM
        weather)
SELECT
   month,
   day,
   temp_maximum.t_max as temp_max
FROM
   weather, temp_maximum
WHERE
   temperature = temp_max;

-- month | day | temp_max
-- 4	7	345

-- using window function
WITH win_temp_max AS (SELECT month,
                             day,
                             temperature,
                             rank() over win_temp_max AS temp_rank
                      FROM weather
                      WINDOW win_temp_max AS (ORDER BY temperature DESC))
SELECT
    *
FROM
    win_temp_max
WHERE
    temp_rank = 1;
