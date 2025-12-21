--
--Задание 10.
-- Таблица residents содержит информацию о жителях Найденовска.
-- а) Выясните,  сколько человек в семьях с фамилиями, начинающимися на “Р”?
-- б) Сколько всего таких различных фамилий?
-- Оба пункта необходимо выполнить одним запросом.
-- ⚠️ Для решения вы можете прочитать: https://sql-academy.org/ru/guide/operator-like

SELECT
    count(*) as family_members_count,
    count(DISTINCT family) as family_count
FROM
    residents
WHERE
    family LIKE 'Р%'

-- family_members_count | family_count
-- ---------------------------------
-- 5                    | 1