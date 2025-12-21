--
--Задание 25.
-- Найдите имя и фамилию человек, который ничего никогда не терял.

SELECT
    residents.family AS family_who_lost_nothing,
    residents.name
FROM
    residents
LEFT JOIN
        found
            ON found.who = residents.id
WHERE
    found.what IS NULL
ORDER BY family_who_lost_nothing;

-- family_who_lost_nothing	name
--------------------------------
-- Банаховы	    Стефан
-- Дуров	    Лев
-- Кнутовы	    Курт
-- Кнутовы	    Дональд
-- Кустовы	    Ив
-- Лекуновы	    Ян
-- Лекуновы	    Яна
-- Найденкины	Петр
-- Растеряевы	Глафира
-- Хомяковы	    Геннадий
-- Хомяковы	    Ирина