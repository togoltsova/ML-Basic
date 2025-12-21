--
--Задание 2.
-- Какие объекты есть на карте города Найденовска?
-- Выведите их все по одному разу, догадавшись, в каком столбце расположены эти данные?
SELECT
    DISTINCT(object)
FROM
    map;

-- Сколько всего различных объектов?
SELECT
    count(DISTINCT(object))
FROM
    map;

-- Какой объект первый в алфавитном порядке?
SELECT
    DISTINCT(object)
FROM
    map
ORDER BY object
LIMIT 1;
