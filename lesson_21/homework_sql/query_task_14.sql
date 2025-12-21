--
--Задание 14.
-- Сколько всего перчаток потеряли члены семьи Растеряевых?

SELECT
    count(what)
FROM
    found
LEFT JOIN
        residents
            ON found.who = residents.id
WHERE
    residents.family == 'Растеряевы'
    AND what == 'Перчатка';

-- count(what)
-- ----
-- 5