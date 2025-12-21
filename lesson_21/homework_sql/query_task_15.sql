--
--Задание 15.
-- Сколько всего перчаток потеряла Мария Растеряева?

SELECT
    count(what)
FROM
    found
LEFT JOIN
        residents
            ON found.who = residents.id
WHERE
    residents.family == 'Растеряевы'
    AND residents.name == 'Мария'
    AND what == 'Перчатка';

-- count(what)
-- ----
-- 5