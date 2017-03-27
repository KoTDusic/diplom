
delete from "Преподаватель"

set serveroutput on;

select * from "Лабораторные";
select * from "Дисциплина";

select * from "Подгруппы";
select * from "Успеваемость";
select * from "Студенты";
exec LOAD_LABS(22);






select STUDENT_DISCIPLINE."Код_дисциплины","Преподаватель","Код_студента",
        "Название_лабораторной" from STUDENT_DISCIPLINE,"Лабораторные" 
        where "Лабораторные"."Код_дисциплины"=STUDENT_DISCIPLINE."Код_дисциплины" AND "Код_студента"=28;
select count(*) from "Нагрузка_преподавателя" 
where "Код_подгруппы" = 42 AND "Код_преподавателя" = 23 AND "Код_дисциплины" = 123;

select * from STUDENT_LIST;

select * from STUDENT_LIST;
select * from LAB_LIST;
select * from FACULTY_LIST;
select * from KOORS_LIST where "Курс"=2;
select * from TEACHER_DISCIPLINE_LIST where "Преподаватель"='Преподаватель2';
select * from "Нагрузка_преподавателя"

select "Имя_специальности",GET_KOORS_BY_YEAR("Год_поступления") as "Курс","Номер_группы","Номер_подгруппы","ФИО"
from "Студенты", "Подгруппы","Группы","Специальность"
where 
"Студенты"."Код_подгруппы"="Подгруппы"."Код_подгруппы" AND
"Подгруппы"."Код_группы"="Группы"."Код_группы" AND
"Специальность"."Код_специальности"="Группы"."Код_специальности"
order by "Имя_специальности";

select * from "Подгруппы"
select * from "Группы"
select * from TEACHER_DISCIPLINE_LIST "3fa7114d-5fb9-4f64-be58-a77c16e1dbf1"

select * from "Преподаватель";
execute ADD_TEACHER('Преподаватель1');
execute ADD_TEACHER('Преподаватель2');
execute ADD_TEACHER('Преподаватель3');
execute ADD_TEACHER('Ганс');
execute REMOVE_TEACHER('asdasd-12-asf');
execute ADD_TEACHER('Бутылка Рома Ёхохович');

select * from "Факультет";
execute ADD_FACULTY('ФИТ');
exec ADD_FACULTY('ИЭФ');
exec ADD_FACULTY('ТОВ');

execute REMOVE_FACULTY('ИЭФ');


select * from "Специальность";
execute ADD_SPECIALITIS('ФИТ','1-1101','ИСиТ');
execute ADD_SPECIALITIS('ФИТ','1-1102','ПОиСОИ');
exec ADD_SPECIALITIS('ТОВ','1-1103','Химик-технолог');
exec ADD_SPECIALITIS('ТОВ','1-1105','Химик-полиграфист');
exec ADD_SPECIALITIS('ИЭФ','1-1104','Экономист');
exec ADD_SPECIALITIS('ИЭФ','1-1104','Экономист-технолог');
exec ADD_SPECIALITIS('ФИТ','1111_123','Что то');
execute REMOVE_SPECIALITIS('ФИТ','ИСиТ');
execute REMOVE_SPECIALITIS('ФИТ','ПОиСОИ');
delete from "Специальность" where "Код_специальности"='1111_123'

delete from "Дисциплина" where "Код_дисциплины"=144;
execute ADD_DISCIPLINE('1-1101','Системное программирование');
execute ADD_DISCIPLINE('1-1101','Программирование в Internet');
execute ADD_DISCIPLINE('1-1102','Схемотехника');
execute REMOVE_DISCIPLINE('1-1101','Программирование в Internet');
execute REMOVE_DISCIPLINE('007','листaние ленты в соц сетях');
select * from "Лабораторные";
execute ADD_LAB('Системное программирование','Агрегирование');
execute ADD_LAB('Системное программирование','Делегирование');
execute ADD_LAB('Системное программирование','COM EXE');
execute ADD_LAB('Программирование в Internet','Сервлет');
execute ADD_LAB('Программирование в Internet','AJAX');
execute ADD_LAB('Схемотехника','ShemBuilder');
execute REMOVE_LAB('Программирование в Internet','Сервлет');
execute REMOVE_LAB('Системное программирование','Делегирование');

execute REMOVE_LAB('Программирование в Internet','1111');

select * from "Группы";
execute ADD_GROUP('1-1101',2013,1);
execute ADD_GROUP('1-1101',2013,2);
execute ADD_GROUP('1-1102',2013,1);
execute ADD_GROUP('1-1102',2013,2);
execute ADD_GROUP('1-1105',2013,1);

exec ADD_GROUP('1-1103',2014,1);
exec ADD_GROUP('1-1103',2014,2);
exec ADD_GROUP('1-1104',2012,1);
execute ADD_SUBGROUP('1-1102',2013,7,1);
execute ADD_SUBGROUP('1-1105',2013,1,1);
select * from "Подгруппы";
execute ADD_SUBGROUP('1-1101',2013,1,1);
execute ADD_SUBGROUP('1-1101',2013,1,2);
execute ADD_SUBGROUP('1-1101',2013,2,1);
execute ADD_SUBGROUP('1-1101',2013,2,2);
execute ADD_SUBGROUP('1-1102',2013,1,1);
execute ADD_SUBGROUP('1-1102',2013,2,1);
execute REMOVE_SUBGROUP('1-1101',2013,1,1);
execute REMOVE_SUBGROUP('1-1101',2013,1,2);
execute REMOVE_SUBGROUP('1-1101',2013,2,1);
execute REMOVE_SUBGROUP('1-1101',2013,2,2);

select * from "Студенты";
execute ADD_STUDENT('1-1101',2013,2,1,'Студент1');
execute ADD_STUDENT('1-1101',2013,1,1,'Студент2');
execute ADD_STUDENT('1-1101',2013,1,2,'Студент3');
execute ADD_STUDENT('1-1101',2013,2,2,'Студент4');
execute ADD_STUDENT('1-1101',2013,2,1,'Студент5');
execute ADD_STUDENT('1-1101',2013,1,1,'Студент6');
execute ADD_STUDENT('1-1102',2013,2,1,'Студент7');
execute ADD_STUDENT('1-1105',2013,1,1,'Никон');
execute ADD_STUDENT('1-1105',2013,1,1,'Кэнон');
execute ADD_STUDENT('1-1105',2013,1,1,'Зенит');
execute REMOVE_STUDENT('1',3012,2,1,'asfa');

select * from "Подгруппы";
select * from "Нагрузка_преподавателя";
execute ADD_WORK('1-1101',2013,1,1,'Преподаватель2','Системное программирование');
execute ADD_WORK('1-1101',2013,1,1,'Преподаватель2','Программирование в Internet');
execute ADD_WORK('1-1101',2013,2,1,'Преподаватель1','Системное программирование');
execute ADD_WORK('1-1101',2013,2,1,'Преподаватель1','Программирование в Internet');
execute ADD_WORK('1-1102',2013,2,1,'Преподаватель3','Схемотехника');
execute ADD_WORK('1-1105',2013,1,1,'Ганс','смешивание красненького и голубенького');
execute REMOVE_WORK('1-1101',2013,2,1,'Преподаватель1','Системное программирование');

select * from "Дисциплина"
select * from "Студенты";

execute SET_PROGRESS(1,'Преподаватель2',6,'Делегирование','Не сдано');
execute SET_PROGRESS(1,'Преподаватель2',6,'Делегирование','Сдано');
execute SET_PROGRESS(1,'Преподаватель2',2,'Делегирование','Сдано');
execute SET_PROGRESS(3,'Преподаватель3',7,'ShemBuilder','Сдано');
execute ADD_LAB('сохранение картинок','сохранять картинки');
execute SET_PROGRESS(1,'Преподаватель2',2,'Агрегирование','Сдано');
delete from "Лабораторные" where "Название_лабораторной"='<>'
select * from "Лабораторные";
select * from "Успеваемость";
select * from "Студенты";
select * from STUDENT_LIST;
select * from LAB_LIST;
select * from FACULTY_LIST;
select * from KOORS_LIST where "Курс"=2;
select * from TEACHER_DISCIPLINE_LIST where "Преподаватель"='Преподаватель3';

select * from "Студенты" Where "ФИО"='wtrwteww'

select * from "Дисциплина";
select * from "Студенты";
select * from  "Нагрузка_преподавателя"
select count(*) from "Нагрузка_преподавателя"
where "Код_подгруппы" = 16 AND "Код_преподавателя" = 43
AND "Код_дисциплины" = 2;
select * from "Успеваемость";
select * from TEACHER_DISCIPLINE_LIST;
select * from LAB_LIST;

select "Код_группы",
       "Имя_специальности",
       "Год_поступления",
       "Номер_группы"
  from "Группы","Специальность" where "Группы"."Код_специальности"="Специальность"."Код_специальности"

select "Лабораторные"."Название_лабораторной" as "Название_лабораторной" 
 from "Дисциплина" "Дисциплина",
    "Лабораторные" "Лабораторные" 
 where "Лабораторные"."Код_дисциплины"="Дисциплина"."Код_дисциплины" AND "Дисциплина"."Наименование_дисциплины"='Системное программирование'