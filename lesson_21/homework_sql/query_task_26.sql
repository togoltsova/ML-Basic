--
--Задание 26.
-- Найдите имена и фамилии людей,
-- кто терял в одном и том же месте одну и ту же вещь несколько раз (т.е. не меньше 2 раз).

SELECT
    residents.family AS family_who_lost_smth,
    residents.name,
    found.what,
    count(found.what) AS how_many_times
FROM
    residents
LEFT JOIN
        found
            ON found.who = residents.id
GROUP BY residents.family, residents.name, found.what
HAVING how_many_times > 1

-- family_who_lost_smth | name | what |	how_many_times
------------------------------------------------------
-- Дуров	    Павел	Совесть	    3
-- Кустовы	    Жак	    Часы	    2
-- Растеряевы	Мария	Перчатка	5