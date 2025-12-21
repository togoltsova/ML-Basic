--
--Задание 19.
-- Как вы думаете, где живет Мария Растеряева, если ее дом расположен где-то вдоль трассы,
-- а ходит она только в школу и только по прямой?
--
-- Необходимо назвать координаты.
WITH highway_coord AS (
    SELECT
        x, y
    FROM
        map
    WHERE
        map.object == 'Трасса'
    ),
    school_coord AS (SELECT
        x, y
    FROM
        map
    WHERE
        map.object == 'Школа'
    )
SELECT
    map.*,
    highway_coord.x AS highway_x, highway_coord.y AS highway_y,
    school_coord.x AS school_x, school_coord.y AS school_y
FROM
    map, highway_coord, school_coord
WHERE ((map.x = highway_x + 1 OR map.x = highway_x - 1)
           AND map.y = school_y AND school_y = highway_y)
    OR ((map.y = highway_y - 1 OR map.y = highway_y + 1)
            AND map.x = school_x AND school_x = highway_x)


-- x | y | object
-- --------------
-- 10	1	Пустырь