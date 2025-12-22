--
--Задание 18.
-- Назовите фамилии людей, потерявших что-то у  склепа?
SELECT
    DISTINCT residents.family AS family_who_lost_smth_in_crypt
FROM
    found
LEFT JOIN
        map
            ON found.where_x = map.x
LEFT JOIN
        residents
            ON found.who = residents.id
WHERE
    map.object == 'Склеп'
    AND where_y = map.y;

-- family_who_lost_smth_in_crypt
-- ----
-- Растеряевы
-- Дуров

-- second solution
SELECT
    DISTINCT residents.family AS family_who_lost_smth_in_crypt
FROM
    found
INNER JOIN
        map
            ON found.where_x = map.x
INNER JOIN
        residents
            ON found.who = residents.id
WHERE
    map.object == 'Склеп'
    AND where_y = map.y;
