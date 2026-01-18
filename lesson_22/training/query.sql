-- Вычислить среднюю зарплату сотрудников для каждой компании
SELECT distinct com.company_id,
                com.company_name,
                avg(emp.salary) OVER (PARTITION BY dep.company_id) as average_salary
FROM employees emp
         JOIN departments dep ON dep.department_id = emp.department_id
         JOIN companies com ON com.company_id = dep.company_id;
-- company_id | company_name        | average_salary
-- 1	      |  Tech Innovations   | 126666.66666666667

-- Определить количество сотрудников в каждой компании
SELECT distinct com.company_id,
                com.company_name,
                count(emp.employee_id) OVER (PARTITION BY dep.company_id) as employee_count
FROM employees emp
         JOIN departments dep ON dep.department_id = emp.department_id
         JOIN companies com ON com.company_id = dep.company_id;
-- company_id | company_name        | employee_count
-- 1	      |  Tech Innovations   | 3

-- Включить в итоговый отчет только компании, где работает более 5 сотрудников
-- REMARK: Отчет будет пустой, т.к. в таблице employees всего 3 записи (< 5)
SELECT COUNT() as employee_count
FROM employees emp;
-- employee_count
-- 3
WITH companies_with_employees AS (SELECT distinct com.company_id,
                                                  com.company_name,
                                                  count(emp.employee_id) OVER (PARTITION BY dep.company_id) as employee_count
                                  FROM employees emp
                                           JOIN departments dep ON dep.department_id = emp.department_id
                                           JOIN companies com ON com.company_id = dep.company_id)
SELECT *
FROM companies_with_employees
WHERE employee_count >= 5;
-- the result is empty

-- Ранжировать компании по уровню средней зарплаты (от высшей к низшей)
WITH companies_with_employees AS (SELECT distinct com.company_id,
                                                  com.company_name,
                                                  count(emp.employee_id) OVER (PARTITION BY dep.company_id) as employee_count,
                                                  avg(emp.salary) OVER (PARTITION BY dep.company_id) as average_salary
                                  FROM employees emp
                                           JOIN departments dep ON dep.department_id = emp.department_id
                                           JOIN companies com ON com.company_id = dep.company_id)
SELECT *, rank() OVER (ORDER BY average_salary DESC)
FROM companies_with_employees
WHERE employee_count >= 5;
-- the result is empty

-- Округлить значения средней зарплаты до двух знаков после запятой для улучшения читаемости
WITH companies_with_employees AS (SELECT distinct com.company_id,
                                                  com.company_name,
                                                  count(emp.employee_id) OVER (PARTITION BY dep.company_id) as employee_count,
                                                  round(avg(emp.salary) OVER (PARTITION BY dep.company_id), 2) as average_salary
                                  FROM employees emp
                                           JOIN departments dep ON dep.department_id = emp.department_id
                                           JOIN companies com ON com.company_id = dep.company_id)
SELECT *, rank() OVER (ORDER BY average_salary DESC)
FROM companies_with_employees
WHERE employee_count >= 5;
-- the result is empty

-- Вывести результаты в порядке убывания средней зарплаты
WITH companies_with_employees AS (SELECT distinct com.company_id,
                                                  com.company_name,
                                                  count(emp.employee_id) OVER (PARTITION BY dep.company_id) as employee_count,
                                                  round(avg(emp.salary) OVER (PARTITION BY dep.company_id), 2) as average_salary
                                  FROM employees emp
                                           JOIN departments dep ON dep.department_id = emp.department_id
                                           JOIN companies com ON com.company_id = dep.company_id)
SELECT *,
       rank() OVER (ORDER BY average_salary DESC) as salary_rank
FROM companies_with_employees
WHERE employee_count >= 5
ORDER BY average_salary DESC;
-- the result is empty

-- distinct => GROUP BY
WITH companies_with_employees AS (SELECT com.company_id,
                                                  com.company_name,
                                                  count(emp.employee_id) OVER (PARTITION BY dep.company_id) as employee_count,
                                                  round(avg(emp.salary) OVER (PARTITION BY dep.company_id), 2) as average_salary
                                  FROM employees emp
                                           JOIN departments dep ON dep.department_id = emp.department_id
                                           JOIN companies com ON com.company_id = dep.company_id
                                  GROUP BY com.company_id, com.company_name)
SELECT *,
       rank() OVER (ORDER BY average_salary DESC) as salary_rank
FROM companies_with_employees
WHERE employee_count >= 5
ORDER BY average_salary DESC;