--
--Задание 12.
-- В таблице found находятся данные о найденных вещах в городе Найденовске в марте.
-- Исследуйте эту таблицу и посчитайте,
-- сколько всего вещей было найдено в марте в области, обозначенной серым (выше диагонали)?

PRAGMA
    table_info(found);

-- column | type
-- who	TEXT
-- where_x	INT
-- where_y	INT
-- what	TEXT

SELECT
    *
FROM
    found
ORDER BY where_x
LIMIT 5;

-- who | where_x |	where_y | what
-- 3	0	337	Ошейник
-- 0	1	234
-- 20	1	234	Перчатка
-- 4	1	631	Грабли
-- 12	2	31	Пульт от телефизора

SELECT
    count(*) AS found_count
FROM
    found
WHERE
    where_x >= where_y
    AND what IS NOT NULL;

-- found_count
-- 1

SELECT
    *
FROM
    found
WHERE
    where_x >= where_y
    AND what IS NOT NULL;

-- who | where_x | where_y | what
-- 5	14	12	Нашники