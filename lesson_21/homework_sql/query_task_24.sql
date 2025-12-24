--
--Задание 24.
-- Найдите одним запросом координаты второй по высоте точки (известно, что она одна). Что там расположено?

SELECT
    x,
    y,
    object,
    height
FROM
    map
WHERE
    height < (SELECT
                  MAX(height)
              FROM
                  map
              )
ORDER BY height DESC
LIMIT 1;

-- x | y | object | height
-----------------------------
-- 14	4	Трасса	1400