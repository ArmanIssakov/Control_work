#7 В подключённом MySQL репозитории создать базу данных “Друзья человека”

DROP DATABASE IF EXISTS друзья_человека;
CREATE DATABASE друзья_человека;
USE друзья_человека;

#8 Создать таблицы с иерархией из диаграммы в БД

CREATE TABLE классы_животных (
id 	INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
класс_животных VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO классы_животных (id, класс_животных)
VALUES (1, 'Домашние животные'),
	   (2, 'Вьючные животные');
       
#9. Заполнить низкоуровневые таблицы именами(животных), командами которые они выполняют и датами рождения
       
CREATE TABLE собаки (
id SERIAL,
класс_животного INT UNSIGNED NOT NULL,
имя VARCHAR(100),
команды VARCHAR(100),
день_рождения DATE,
FOREIGN KEY (класс_животного) REFERENCES классы_животных(id)
);

INSERT INTO собаки (класс_животного, имя, команды, день_рождения)
VALUES  (1, 'Сосиска','сидеть, лежать','2022-01-01'),
		(1, 'Сухарик','сидеть, голос, фас','2021-03-01');
        
CREATE TABLE кошки (
id SERIAL,
класс_животного INT UNSIGNED NOT NULL,
имя VARCHAR(100),
команды VARCHAR(100),
день_рождения DATE,
FOREIGN KEY (класс_животного) REFERENCES классы_животных(id)
);

INSERT INTO кошки (класс_животного, имя, команды, день_рождения)
VALUES  (1, 'Люкс','место, голос','2022-09-01'),
		(1, 'Пучок','фас, место','2020-06-01');
        
CREATE TABLE хомяки (
id SERIAL,
класс_животного INT UNSIGNED NOT NULL,
имя VARCHAR(100),
команды VARCHAR(100),
день_рождения DATE,
FOREIGN KEY (класс_животного) REFERENCES классы_животных(id)
);

INSERT INTO хомяки (класс_животного, имя, команды, день_рождения)
VALUES  (1, 'Колобок','место, голос','2022-09-01'),
		(1, 'Батон','фас, копать','2009-06-01');
        
        
CREATE TABLE лошади (
id SERIAL,
класс_животного INT UNSIGNED NOT NULL,
имя VARCHAR(100),
команды VARCHAR(100),
день_рождения DATE,
FOREIGN KEY (класс_животного) REFERENCES классы_животных(id)
);

INSERT INTO лошади (класс_животного, имя, команды, день_рождения)
VALUES  (2, 'Мустанг','место, лежать','2020-09-01'),
		(2, 'Ферари','колено, место','2018-06-01');
        
        
CREATE TABLE верблюды (
id SERIAL,
класс_животного INT UNSIGNED NOT NULL,
имя VARCHAR(100),
команды VARCHAR(100),
день_рождения DATE,
FOREIGN KEY (класс_животного) REFERENCES классы_животных(id)
);

INSERT INTO верблюды (класс_животного, имя, команды, день_рождения)
VALUES  (2, 'Песок','место, колено','2022-09-01'),
		(2, 'Атлет','колено, место, можно','2018-06-01');
        
        
CREATE TABLE ослы (
id SERIAL,
класс_животного INT UNSIGNED NOT NULL,
имя VARCHAR(100),
команды VARCHAR(100),
день_рождения DATE,
FOREIGN KEY (класс_животного) REFERENCES классы_животных(id)
);

INSERT INTO ослы (класс_животного, имя, команды, день_рождения)
VALUES  (2, 'Пузатик','место, лежать','2022-07-01'),
		(2, 'Белый','место','2022-06-01');
        
#10 Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой питомник на зимовку. Объединить таблицы лошади, и ослы в одну таблицу.
        
DROP TABLE IF EXISTS верблюды;

SELECT * 
FROM лошади
UNION All
SELECT *
FROM ослы;

#11 Создать новую таблицу “молодые животные” в которую попадут все животные старше 1 года, 
#но младше 3 лет и в отдельном столбце с точностью до месяца подсчитать возраст животных в новой таблице

SELECT *, 
CONCAT(
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) DIV 12),
' года', ' ', 
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) % 12),
' месяцев'
)  AS возраст
FROM собаки
WHERE TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) >=1 
AND TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) <=3
UNION ALL
SELECT *, 
CONCAT(
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) DIV 12),
' года', ' ', 
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) % 12),
' месяцев'
)  AS возраст
FROM кошки
WHERE TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) >=1 
AND TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) <=3
UNION ALL
SELECT *, 
CONCAT(
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) DIV 12),
' года', ' ', 
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) % 12),
' месяцев'
)  AS возраст
FROM хомяки
WHERE TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) >=1 
AND TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) <=3
UNION ALL
SELECT *, 
CONCAT(
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) DIV 12),
' года', ' ', 
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) % 12),
' месяцев'
)  AS возраст
FROM лошади
WHERE TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) >=1 
AND TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) <=3
UNION ALL
SELECT *, 
CONCAT(
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) DIV 12),
' года', ' ', 
(TIMESTAMPDIFF(MONTH, день_рождения, CURDATE()) % 12),
' месяцев'
)  AS возраст
FROM ослы
WHERE TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) >=1 
AND TIMESTAMPDIFF(YEAR, день_рождения, CURDATE()) <=3
;

#12 Объединить все таблицы в одну, при этом сохраняя поля, указывающие на прошлую принадлежность к старым таблицам.
SELECT * 
FROM лошади
UNION All
SELECT *
FROM ослы
UNION All
SELECT *
FROM кошки
UNION All
SELECT *
FROM собаки
UNION All
SELECT *
FROM хомяки;







