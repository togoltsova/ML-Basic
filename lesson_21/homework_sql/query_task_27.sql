--
--Задание 27.
-- Один человек умудрился потерять некий объект трижды на одной долготе (с одним y).
-- Кто это и что он потерял.

SELECT
    residents.family AS family_who_lost_smth,
    residents.name,
    found.what,
    found.where_y,
    count(found.what) AS how_many_times
FROM
    residents
LEFT JOIN
        found
            ON found.who = residents.id
GROUP BY residents.family, residents.name, found.what, found.where_y
HAVING how_many_times == 3

-- family_who_lost_smth | name | what | wheer_y | how_many_times
------------------------------------------------------
-- Дуров	Павел	Совесть	    700	    3