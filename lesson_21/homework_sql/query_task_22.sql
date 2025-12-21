--
--Задание 22.
-- Выведите семью, в которой всего лишь один человек.

SELECT
    family,
    count(*) AS family_members_count
FROM
    residents
GROUP BY family
HAVING family_members_count = 1;

-- family | family_members_count
-- -----------------------------
-- Многоликовы	1