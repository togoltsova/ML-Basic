--
--Задание 17.
-- Сколько человек потеряли что-то в школе за всю историю?
SELECT
    count(DISTINCT who)
FROM
    found
LEFT JOIN
        map
            ON found.where_x = map.x
WHERE
    map.object == 'Школа'
    AND where_y = map.y;

-- count(DISTINCT who)
-- ----
-- 3