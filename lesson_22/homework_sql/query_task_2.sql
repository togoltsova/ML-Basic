--
--Задание 2.
--Информация о скольких месяцах представлена в таблице?

SELECT
    count(DISTINCT month)
FROM
    weather

-- count(DISTINCT month)
-- 4
