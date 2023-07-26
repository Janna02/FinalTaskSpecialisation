1. Используя команду cat в терминале операционной системы Linux, создать
два файла Домашние животные (заполнив файл собаками, кошками,
хомяками) и Вьючные животными заполнив файл Лошадьми, верблюдами и
ослы), а затем объединить их. Просмотреть содержимое созданного файла.
Переименовать файл, дав ему новое имя (Друзья человека).

root@gb:/# mkdir finalwork
root@gb:/# cd finalwork/
root@gb:/finalwork# cat > "Домашние животные.txt"
Собака
Кошка
Хомяк
^C
root@gb:/finalwork# cat > "Вьючные животные.txt"
Лошадь
Верблюд
Осел
^C
root@gb:/finalwork# cat "Домашние животные.txt" "Вьючные животные.txt" > "Объединенный файл.txt"
root@gb:/finalwork# cat "Объединенный файл.txt"
Собака
Кошка
Хомяк
Лошадь
Верблюд
Осел
root@gb:/finalwork# mv 'Объединенный файл.txt' Друзья_человека.txt
root@gb:/finalwork# ls -l
итого 12
-rw-r--r-- 1 root root 37 июл 26 18:43 'Вьючные животные.txt'
-rw-r--r-- 1 root root 35 июл 26 18:43 'Домашние животные.txt'
-rw-r--r-- 1 root root 72 июл 26 18:44  Друзья_человека.txt
root@gb:/finalwork# cat Друзья_человека.txt
Собака
Кошка
Хомяк
Лошадь
Верблюд
Осел


2.Создать директорию, переместить файл туда.

root@gb:/finalwork# mkdir HumanFriends
root@gb:/finalwork# mv Друзья_человека.txt HumanFriends
root@gb:/finalwork# ls HumanFriends
Друзья_человека.txt

3. Подключить дополнительный репозиторий MySQL. Установить любой пакет
из этого репозитория.

root@gb:/# wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb

root@gb:/# sudo apt-get update

root@gb:/# sudo apt-get install mysql-server

![image](https://github.com/Janna02/FinalTaskSpecialisation/assets/10546158/f652a3ef-2743-4766-a945-8da0c494ef23)

 4. Установить и удалить deb-пакет с помощью dpkg.
root@gb:/# wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
root@gb:/# sudo dpkg - i mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
root@gb:/# sudo dpkg -r mysql-connector-j
root@gb:/# sudo apt-get autoremove

5. Выложить историю команд в терминале ubuntu

![image](https://github.com/Janna02/FinalTaskSpecialisation/assets/10546158/e57fbb76-f61c-439a-bd4a-a2957d3fc7e4)


![image](https://github.com/Janna02/FinalTaskSpecialisation/assets/10546158/8b64f972-a629-4f3f-97dc-94fb47df37b9)









