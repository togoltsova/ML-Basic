--
--Задание 1.
--В таблице map собраны данные о расположении различных объектов в городе.
--Напишите запрос, который позволит вам познакомиться с этой таблицей:
--выведете на экран названия столбцов и первые 5 строк содержимого.
SELECT
    *
FROM
    map
LIMIT 5;

-- Получите всю метаинформацию о столбцах.
PRAGMA
    table_info(map);
-- Count of columns
SELECT
    count(*)
FROM
    pragma_table_info('map');

-- Получите запрос, которым можно создать таблицу с той же схемой.
SELECT sql
FROM main.sqlite_master
WHERE type = 'table' AND name = 'map';

-- create an empty copy (without indexes and triggers) of a table
CREATE TABLE
    map_copy AS
        SELECT
            *
        FROM
            map
        WHERE 0;