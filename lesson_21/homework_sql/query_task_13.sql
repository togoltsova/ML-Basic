--
--Задание 13.
-- Теряли ли Растеряевы что-либо одушевленное? Если да, то что кого?

SELECT
    DISTINCT what
FROM
    found
LEFT JOIN
        residents
            ON found.who = residents.id
WHERE
    residents.family == 'Растеряевы'
    AND what IS NOT NULL
    AND what != '';

-- what
-- ----
-- Перчатка
-- Телефон
-- Нашники
-- Пульт от телефизора
-- Ключи
-- Наушники
-- Хомячок
-- Рюкзак