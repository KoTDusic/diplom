set serveroutput on;

execute ADD_FACULTY('ФИТ');
execute ADD_FACULTY('ИЭФ');
execute ADD_FACULTY('ТОВ');

execute ADD_SPECIALITIS(42,1400201,'Информационные системы и технологии (издательско-полиграфический комплекс)');
execute ADD_SPECIALITIS(42,1400101,'Программное обеспечение информационных технологий');
execute ADD_SPECIALITIS(42,1980103,'Пограммное обеспечение информационной безопасности мобильных систем');
execute ADD_SPECIALITIS(42,1470102,'Дизайн электронных и web-изданий');

execute ADD_SPECIALITIS(44,11103,'Химик-технолог');
execute ADD_SPECIALITIS(44,11105,'Химик-полиграфист');
execute ADD_SPECIALITIS(43,11104,'Экономист');
execute ADD_SPECIALITIS(43,11114,'Экономист-технолог');

--truncate table "Специальность";
select * from "Специальность";
select * from "Дисциплина";
select * from "Факультет";

execute ADD_DISCIPLINE(4,'Объектно-ориентированное программирование');
execute ADD_DISCIPLINE(4,'Основы дискретной математики и теории алгоритмов');
execute ADD_DISCIPLINE(4,'Основы защиты информации(с модулем Основы управления интеллектуальной собственностью)');
execute ADD_DISCIPLINE(4,'Базы данных');
execute ADD_DISCIPLINE(4,'Компьютерные сети');
execute ADD_DISCIPLINE(4,'Основы информационных технологий');
execute ADD_DISCIPLINE(4,'Компьютерные мультимедийные системы');
execute ADD_DISCIPLINE(4,'Математическое программирование');
execute ADD_DISCIPLINE(4,'Криптографические методы защиты информации');
execute ADD_DISCIPLINE(4,'Компьютерные языки разметки');
execute ADD_DISCIPLINE(4,'Основы алгоритмизации и программирования');
execute ADD_DISCIPLINE(1,'Системное программирование');
execute ADD_DISCIPLINE(1,'Защита информации и надежность информационных систем');
execute ADD_DISCIPLINE(1,'Облачные технологии');
execute ADD_DISCIPLINE(1,'Разработка динамических web-приложений');
execute ADD_DISCIPLINE(1,'Основы информационных технологий');
execute ADD_DISCIPLINE(1,'Объектно-ориентированное программирование');
execute ADD_DISCIPLINE(1,'Тестирование программного обеспечения');
execute ADD_DISCIPLINE(1,'Математическое программирование');
execute ADD_DISCIPLINE(1,'Основы алгоритмизации и программирования');
execute ADD_DISCIPLINE(1,'Операционные системы');
execute ADD_DISCIPLINE(1,'Управление IT-проектами и информационный менеджмент');
execute ADD_DISCIPLINE(1,'Компьютерные сети');
execute ADD_DISCIPLINE(1,'Администрирование баз данных и приложений');
execute ADD_DISCIPLINE(1,'Базы данных');
execute ADD_DISCIPLINE(1,'Основы защиты информации(с модулем Основы управления интеллектуальной собственностью)');
execute ADD_DISCIPLINE(1,'Программирование в Интернет');
execute ADD_DISCIPLINE(1,'Программирование сетевых приложений');
execute ADD_DISCIPLINE(1,'Моделирование и оптимизация процессов и систем');
execute ADD_DISCIPLINE(1,'Компьютерные мультимедийные системы в издательском деле');
execute ADD_DISCIPLINE(1,'Основы дискретной математики и теории алгоритмов');
execute ADD_DISCIPLINE(1,'Программирование мобильных систем');
execute ADD_DISCIPLINE(1,'Встроенные системы');
execute ADD_DISCIPLINE(1,'Распределенные информационные системы');
execute ADD_DISCIPLINE(1,'Арифметико-логические основы цифровых вычислительных машин и архитектура компьютера');
execute ADD_DISCIPLINE(1,'Системы и технологии интеллектуальной обработки данных');
execute ADD_DISCIPLINE(3,'Облачные технологии');
execute ADD_DISCIPLINE(3,'Тестирование и стандартизация программного обеспечения мобильных устройств');
execute ADD_DISCIPLINE(3,'Основы информационных технологий');
execute ADD_DISCIPLINE(3,'Компьютерные языки разметки');
execute ADD_DISCIPLINE(3,'Базы данных');
execute ADD_DISCIPLINE(3,'Безопасность программного обеспечения мобильных систем');
execute ADD_DISCIPLINE(3,'Программирование мультимедийных и многомерных мобильных приложений');
execute ADD_DISCIPLINE(3,'Управление IT-проектами и информационный менеджмент');
execute ADD_DISCIPLINE(3,'Основы дискретной математики и теории алгоритмов');
execute ADD_DISCIPLINE(3,'Математическое программирование');
execute ADD_DISCIPLINE(3,'Системы мобильной связи');
execute ADD_DISCIPLINE(3,'Программирование в Интернет');
execute ADD_DISCIPLINE(3,'Основы алгоритмизации и программирования');
execute ADD_DISCIPLINE(3,'Программирование и безопасность сетевых приложений');
execute ADD_DISCIPLINE(3,'Программирование Интернет-серверов');
execute ADD_DISCIPLINE(3,'Арифметико-логические основы цифровых вычислительных машин и архитектура компьютера');
execute ADD_DISCIPLINE(3,'Основы защиты информации(с модулем Основы управления интеллектуальной собственностью)');
execute ADD_DISCIPLINE(3,'Криптографические методы защиты информации');
execute ADD_DISCIPLINE(3,'Программирование и безопасность баз данных мобильных систем');
execute ADD_DISCIPLINE(3,'Программное обеспечение безопасных мобильных систем');
execute ADD_DISCIPLINE(3,'Современные технологии программирования мобильных систем');
execute ADD_DISCIPLINE(3,'Математические основы криптографии');
execute ADD_DISCIPLINE(3,'Система разработки кросплатформенных мобильных приложений');
execute ADD_DISCIPLINE(3,'Проектирование программного обеспечения мобильных систем');
execute ADD_DISCIPLINE(3,'Программное обеспечение встроенных и smart систем');
execute ADD_DISCIPLINE(3,'Стандартизация информационных систем и технологий');
execute ADD_DISCIPLINE(3,'Операционные системы мобильных устройств');
execute ADD_DISCIPLINE(3,'Компьютерные сети');
execute ADD_DISCIPLINE(2,'Проектирование Интернет-систем');
execute ADD_DISCIPLINE(2,'Программирование в Интернет');
execute ADD_DISCIPLINE(2,'Объектно-ориентированные технологии программирования и стандарты проектирования');
execute ADD_DISCIPLINE(2,'Программирование Интернет-серверов');
execute ADD_DISCIPLINE(2,'Администрирование и безопасность Интернет-систем');
execute ADD_DISCIPLINE(2,'Надежность программного обеспечения');
execute ADD_DISCIPLINE(2,'Корпоративные информационные системы');
execute ADD_DISCIPLINE(2,'Управление IT-проектами и информационный менеджмент');
execute ADD_DISCIPLINE(2,'Компьютерные языки разметки');
execute ADD_DISCIPLINE(2,'Web-дизайн и шаблоны проектирования');
execute ADD_DISCIPLINE(2,'Программирование серверных кросплатформенных приложений');
execute ADD_DISCIPLINE(2,'Основы информационных технологий');
execute ADD_DISCIPLINE(2,'Базы данных');
execute ADD_DISCIPLINE(2,'Криптографические методы защиты информации');
execute ADD_DISCIPLINE(2,'Программирование web-сервисов');
execute ADD_DISCIPLINE(2,'Системы управления контентом');
execute ADD_DISCIPLINE(2,'Стандартизация и сертификация информационных систем и технологий');
execute ADD_DISCIPLINE(2,'Языки программирования');
execute ADD_DISCIPLINE(2,'Программирование и безопасность баз данных web-приложений');
execute ADD_DISCIPLINE(2,'Распределенные системы');
execute ADD_DISCIPLINE(2,'Программирование мультимедийных и многомерных приложений');
execute ADD_DISCIPLINE(2,'Арифметико-логические основы цифровых вычислительных машин и архитектура компьютера');
execute ADD_DISCIPLINE(2,'Основы защиты информации(с модулем Основы управления интеллектуальной собственностью)');
execute ADD_DISCIPLINE(2,'Современные технологии программирования в Интернет');
execute ADD_DISCIPLINE(2,'Программирование и безопасность сетевых приложений');
execute ADD_DISCIPLINE(2,'Основы программирования интернет-приложений');
execute ADD_DISCIPLINE(2,'Компьютерные системы и сети');
execute ADD_DISCIPLINE(2,'Основы дискретной математики и теории алгоритмов');
execute ADD_DISCIPLINE(2,'Операционные системы и системное программирование');
execute ADD_DISCIPLINE(2,'Математическое программирование');
execute ADD_DISCIPLINE(2,'Основы алгоритмизации и программирования');


execute ADD_LAB('Системное программирование','Агрегирование');
execute ADD_LAB('Системное программирование','Делегирование');
execute ADD_LAB('Системное программирование','COM EXE');
execute ADD_LAB('Программирование в Интернет','Сервлет');
execute ADD_LAB('Программирование в Интернет','AJAX');

select * from "Лабораторные"
select * from LAB_LIST
select * from LAB_LIST WHERE "Преподаватель" = 'Преподаватель2' AND "Наименование_дисциплины"='Программирование в Интернет'

select * from "Дисциплина"

execute ADD_GROUP(1400201,2013,1);
execute ADD_GROUP(1400201,2013,2);
execute ADD_GROUP(1400201,2013,1);
execute ADD_GROUP(1400201,2013,2);
execute ADD_GROUP(1400201,2013,1);
execute ADD_GROUP(1400201,2014,1);
execute ADD_GROUP(1400201,2014,2);
execute ADD_GROUP(1400201,2012,1);

execute ADD_SUBGROUP(1400201,2013,1,1);
execute ADD_SUBGROUP(1400201,2013,1,2);
execute ADD_SUBGROUP(1400201,2013,2,1);
execute ADD_SUBGROUP(1400201,2013,2,2);

execute ADD_STUDENT(1400201,2013,2,1,'Студент1');
execute ADD_STUDENT(1400201,2013,1,1,'Студент2');
execute ADD_STUDENT(1400201,2013,1,2,'Студент3');
execute ADD_STUDENT(1400201,2013,2,2,'Студент4');
execute ADD_STUDENT(1400201,2013,2,1,'Студент5');
execute ADD_STUDENT(1400201,2013,1,1,'Студент6');
execute ADD_STUDENT(1400201,2013,2,1,'Студент7');
execute ADD_STUDENT(1400201,2013,1,1,'Никон');
execute ADD_STUDENT(1400201,2013,1,1,'Кэнон');
execute ADD_STUDENT(1400201,2013,1,1,'Зенит');

select * from "Успеваемость";
select * from "Лабораторные";
select * from "Дисциплина";

execute ADD_WORK(1400201,2013,1,1,'Преподаватель2','Системное программирование');
execute ADD_WORK(1400201,2013,1,1,'Преподаватель2','Программирование в Интернет');
execute ADD_WORK(1400201,2013,2,1,'Преподаватель1','Системное программирование');
execute ADD_WORK(1400201,2013,2,1,'Преподаватель1','Программирование в Интернет');

execute SET_PROGRESS(70,'Преподаватель2',26,'Делегирование','Не сдано');
execute SET_PROGRESS(70,'Преподаватель2',22,'Делегирование','Сдано');
execute SET_PROGRESS(70,'Преподаватель2',26,'Делегирование','Сдано');
execute SET_PROGRESS(53,'Преподаватель2',22,'Агрегирование','Сдано');
execute SET_PROGRESS(53,'Преподаватель2',26,'Агрегирование','Сдано');