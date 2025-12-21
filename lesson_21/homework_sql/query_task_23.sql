--
--Задание 23.
-- Найдите одним запросом координаты самой высокой точки (известно, что она одна). Что там расположено?

SELECT
    x,
    y,
    object,
    height
FROM
    map
WHERE
    height = (SELECT
                  MAX(height)
              FROM
                  map
              );

-- x | y | object | height
-----------------------------
-- 9  15  Fitness-клуб	1515