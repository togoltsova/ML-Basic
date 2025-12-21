--
--Задание 21.
-- Найдите самую большую высоту для каждой из широт.

SELECT
    y AS latitude,
    max(height) AS height_max
FROM
    map
GROUP BY y

-- total 823 rows
-- first 5 rows
-- latitude | height_max
------------------------
-- 0	34
-- 1	44
-- 2	50
-- 3	50
-- 4	1400
-- 5	50