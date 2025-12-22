--
--Задание 7.
-- Линия хребта Горизонтальпы делит Найденовск ровно пополам и строго параллелен горизонтали.
-- Определите, какие объекты расположены на линии этого хребта.
-- а) Для начала вы можете использовать два запроса.
-- б) Попробуйте самостоятельно догадаться, как оформить решение в один запрос.
SELECT DISTINCT object
FROM
    map
WHERE
    y == (SELECT y
            FROM
                map
            WHERE number == (SELECT
                                median(number)
                            FROM
                                map)
            );

-- second solution
SELECT
    object,
    (SELECT
         median(y)
     FROM
         map
    ) AS y_median
FROM
    map
WHERE y = y_median
GROUP BY object;

-- object | y_median
-- Гора	    411
-- Скала	411