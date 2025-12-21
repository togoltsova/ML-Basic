--
--Задание 16.
-- Выведите имена и семьи тех, кто когда либо терял хомячка в следующем формате:
--  ? from family ?

SELECT
    printf('%s из семьи %s', residents.name, residents.family) as who
FROM
    found
LEFT JOIN
        residents
            ON found.who = residents.id
WHERE
    what == 'Хомячок';

-- who
-- ----
-- Мария из семьи Растеряевы
-- Лев из семьи Хомяковы