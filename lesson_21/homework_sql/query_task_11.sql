--
--Задание 11.
-- Разгадайте кроссворд:
--  *
-- ***у****
--  *
SELECT
    name, family
FROM
    residents
WHERE (length(name) == 3
       AND family == 'Хомяковы')
    OR (length(family) == 8
        AND family LIKE '%у%');

-- name | family
-- ---------------------------------
-- Лев	Хомяковы
-- Ян	Лекуновы
-- Яна	Лекуновы