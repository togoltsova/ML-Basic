--
--Задание 8.
-- Найденовский парк имеет форму квадрата  5 на 5 и называется “Английский”.
-- Расположен он в левом верхнем углу города – в начале координат.
-- Постройте карту парка. Саму лужайку отмечать не надо.
SELECT *
FROM
    map
WHERE
    x < 5
  AND y < 5
  AND object != 'Lawn';

-- x	y	object
------------------
-- 2	2	Fountain
-- 2	3	Bench
-- 1	4	Rabbit hole
-- 4	4	Century-old oak


SELECT *
FROM
    map
WHERE
    x < 5
  AND y < 5
  AND object == 'лужайка';

-- Object 'лужайка' not found!