--
--Задание 9.
-- Какую часть площади занимают горы и озера?
--
-- Можно использовать два запроса

SELECT
((SELECT count(*)
    FROM
        map
    WHERE
        object IN ('Озеро', 'Гора','Скала')) * 1.0
     /
    (SELECT count(*) FROM map)) as mountain_lake_part
;

-- mountain_lake_part
-- 0.011016605913325234