root@gb:/# mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.34 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| gb                 |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0,00 sec)

7. В подключенном MySQL репозитории создать базу данных “Друзья
человека”

mysql> create database friendsHuman;
Query OK, 1 row affected (0,01 sec)

mysql> use friendsHuman;
Database changed

8. Создать таблицы с иерархией из диаграммы в БД


mysql> CREATE TABLE cat ( id INT PRIMARY KEY AUTO_INCREMENT, animal_name CHAR(30),     commands TEXT,     date_of_birth
DATE );
Query OK, 0 rows affected (0,06 sec)

mysql> CREATE TABLE dog ( id INT PRIMARY KEY AUTO_INCREMENT, animal_name CHAR(30),     commands TEXT,     date_of_birth
DATE );
Query OK, 0 rows affected (0,05 sec)

mysql> CREATE TABLE hamster ( id INT PRIMARY KEY AUTO_INCREMENT, animal_name CHAR(30),     commands TEXT,     date_of_bi
rth DATE );
Query OK, 0 rows affected (0,05 sec)

mysql> CREATE TABLE horse ( id INT PRIMARY KEY AUTO_INCREMENT, animal_name CHAR(30),     commands TEXT,     date_of_birt
h DATE );
Query OK, 0 rows affected (0,05 sec)

mysql> CREATE TABLE camel ( id INT PRIMARY KEY AUTO_INCREMENT, animal_name CHAR(30),     commands TEXT,     date_of_birt
h DATE );
Query OK, 0 rows affected (0,05 sec)

mysql> CREATE TABLE donkey ( id INT PRIMARY KEY AUTO_INCREMENT, animal_name CHAR(30),     commands TEXT,     date_of_bir
th DATE );
Query OK, 0 rows affected (0,05 sec)


9. Заполнить низкоуровневые таблицы именами(животных), командами
которые они выполняют и датами рождения

mysql>
mysql> INSERT INTO cat (animal_name, commands, date_of_birth) VALUES
    -> ('cata', 'sleep', '2008-04-14'),
    -> ('catb', 'bite', '2022-04-12'),
    -> ('catc', 'give a hand', '2015-09-23');
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0


mysql>
mysql> INSERT INTO dog (animal_name, commands, date_of_birth) VALUES
    -> ('doga', 'follow', '2021-01-09'),
    -> ('dogb', 'sleep', '2023-02-26'),
    -> ('dogc', 'place', '2009-01-03');
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO hamster (animal_name, commands, date_of_birth) VALUES
    -> ('hamstera', 'voice', '2020-10-10'),
    -> ('hamsterb', 'around', '2023-04-16'),
    -> ('hamsterc', 'eat', '2019-12-05');
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO horse (animal_name, commands, date_of_birth) VALUES
    -> ('horsea', 'gallop', '2015-07-11'),
    -> ('horseb', 'sit down', '2021-09-19'),
    -> ('horsec', 'stop', '2019-03-12');
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO camel (animal_name, commands, date_of_birth) VALUES
    -> ('camela', 'sit down', '2017-05-02'),
    -> ('camelb', 'backward', '2022-09-08'),
    -> ('camelc', 'left', '2020-11-30');
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO donkey (animal_name, commands, date_of_birth) VALUES
    -> ('donkeya', 'stop', '2011-12-03'),
    -> ('donkeyb', 'gallop', '2019-11-09'),
    -> ('donkeyc', 'sit down', '2022-03-11');
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

10. Удалив из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
питомник на зимовку

mysql> DROP TABLE camel;
Query OK, 0 rows affected (0,03 sec)

10. Объединить таблицы лошади, и ослы в одну таблицу

mysql> RENAME TABLE horse TO horse_and_donkey;
Query OK, 0 rows affected (0,04 sec)

mysql> INSERT INTO horse_and_donkey (animal_name, commands, date_of_birth)
    -> SELECT animal_name, commands, date_of_birth
    -> FROM donkey;
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DROP TABLE donkey;
Query OK, 0 rows affected (0,03 sec)

mysql> select * from horse_and_donkey;
+----+-------------+----------+---------------+
| id | animal_name | commands | date_of_birth |
+----+-------------+----------+---------------+
|  1 | horsea      | gallop   | 2015-07-11    |
|  2 | horseb      | sit down | 2021-09-19    |
|  3 | horsec      | stop     | 2019-03-12    |
|  4 | donkeya     | stop     | 2011-12-03    |
|  5 | donkeyb     | gallop   | 2019-11-09    |
|  6 | donkeyc     | sit down | 2022-03-11    |
+----+-------------+----------+---------------+
6 rows in set (0,00 sec)

11.Создать новую таблицу “молодые животные”

mysql> CREATE TABLE young_animal (
    -> id INT PRIMARY KEY AUTO_INCREMENT,
    -> animal_name CHAR(30),
    ->     commands TEXT,
    ->     date_of_birth DATE,
    ->     age TEXT);
Query OK, 0 rows affected (0,06 sec)

11. подсчитать возраст животных в новой таблице 

mysql> DELIMITER $$
mysql> CREATE FUNCTION age_animal (date_of_b DATE)
    -> RETURNS TEXT
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE res TEXT DEFAULT '';
    -> SET res = CONCAT(
    ->             TIMESTAMPDIFF(YEAR, date_of_b, CURDATE()),
    ->             ' years ',
    ->             TIMESTAMPDIFF(MONTH, date_of_b, CURDATE()) % 12,
    ->             ' month'
    ->         );
    -> RETURN res;
    -> END $$
ITER ;Query OK, 0 rows affected (0,02 sec)
mysql> DELIMITER ;

11. ” в которую попадут все
животные старше 1 года, но младше 3 лет
  
mysql> INSERT INTO young_animal (animal_name, commands, date_of_birth, age)
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth)
    -> FROM cat
    -> WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 2
    -> UNION ALL
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth)
    -> FROM dog
    -> WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 2
    -> UNION ALL
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth)
    -> FROM hamster
    -> WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 2
    -> UNION ALL
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth)
    -> FROM horse_and_donkey
    -> WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) BETWEEN 1 AND 2;
Query OK, 5 rows affected (0,01 sec)
Records: 5  Duplicates: 0  Warnings: 0

12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам.

mysql> CREATE TABLE animals (
    -> id INT PRIMARY KEY AUTO_INCREMENT,
    -> animal_name CHAR(30),
    ->     commands TEXT,
    ->     date_of_birth DATE,
    ->     age TEXT,
    ->     animal_type ENUM('cat','dog','hamster', 'horse_donkey', 'young_animals') NOT NULL);
Query OK, 0 rows affected (0,08 sec)

mysql> INSERT INTO animals (animal_name, commands, date_of_birth, age, animal_type)
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth), 'cat'
    -> FROM cat;
mal_type)
SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth), 'dog'
FROM dog;

INSERT INTO animals (animal_name, commands, date_of_birth, age, animal_type)
SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth), 'hamster'
FROM hamster;

INSERT INTO animals (animal_name, commands, date_of_birth, age, animal_type)
SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth), 'horse_donkey'
FROM horse_and_donkey;Query OK, 3 rows affected (0,02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO animals (animal_name, commands, date_of_birth, age, animal_type)
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth), 'dog'
    -> FROM dog;
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO animals (animal_name, commands, date_of_birth, age, animal_type)
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth), 'hamster'
    -> FROM hamster;
Query OK, 3 rows affected (0,01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO animals (animal_name, commands, date_of_birth, age, animal_type)
    -> SELECT animal_name, commands, date_of_birth, age_animal(date_of_birth), 'horse_donkey'
    -> FROM horse_and_donkey;
Query OK, 6 rows affected (0,01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| friendsHuman       |
| gb                 |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0,00 sec)

mysql> select * from animals;
+----+-------------+-------------+---------------+------------------+--------------+
| id | animal_name | commands    | date_of_birth | age              | animal_type  |
+----+-------------+-------------+---------------+------------------+--------------+
|  1 | cata        | sleep       | 2008-04-14    | 15 years 3 month | cat          |
|  2 | catb        | bite        | 2022-04-12    | 1 years 3 month  | cat          |
|  3 | catc        | give a hand | 2015-09-23    | 7 years 10 month | cat          |
|  4 | doga        | follow      | 2021-01-09    | 2 years 6 month  | dog          |
|  5 | dogb        | sleep       | 2023-02-26    | 0 years 5 month  | dog          |
|  6 | dogc        | place       | 2009-01-03    | 14 years 6 month | dog          |
|  7 | hamstera    | voice       | 2020-10-10    | 2 years 9 month  | hamster      |
|  8 | hamsterb    | around      | 2023-04-16    | 0 years 3 month  | hamster      |
|  9 | hamsterc    | eat         | 2019-12-05    | 3 years 7 month  | hamster      |
| 10 | horsea      | gallop      | 2015-07-11    | 8 years 0 month  | horse_donkey |
| 11 | horseb      | sit down    | 2021-09-19    | 1 years 10 month | horse_donkey |
| 12 | horsec      | stop        | 2019-03-12    | 4 years 4 month  | horse_donkey |
| 13 | donkeya     | stop        | 2011-12-03    | 11 years 7 month | horse_donkey |
| 14 | donkeyb     | gallop      | 2019-11-09    | 3 years 8 month  | horse_donkey |
| 15 | donkeyc     | sit down    | 2022-03-11    | 1 years 4 month  | horse_donkey |
+----+-------------+-------------+---------------+------------------+--------------+
15 rows in set (0,00 sec)