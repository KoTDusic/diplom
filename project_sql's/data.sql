set serveroutput on;

execute ADD_TEACHER('Преподаватель1','asdasd-12-asf');
execute ADD_TEACHER('Преподаватель2','ertedr-123-fgf');
execute ADD_TEACHER('Преподаватель3','ghkjrtre-54732-rtyrtr');


execute ADD_FACULTY('ФИТ');
execute ADD_FACULTY('ИЭФ');
execute ADD_FACULTY('ТОВ');

execute ADD_SPECIALITIS('ФИТ','1-1101','ИСиТ');
execute ADD_SPECIALITIS('ФИТ','1-1102','ПОиСОИ');
execute ADD_SPECIALITIS('ТОВ','1-1103','Химик-технолог');
execute ADD_SPECIALITIS('ТОВ','1-1105','Химик-полиграфист');
execute ADD_SPECIALITIS('ИЭФ','1-1104','Экономист');
execute ADD_SPECIALITIS('ИЭФ','1-1114','Экономист-технолог');
execute ADD_SPECIALITIS('ФИТ','1111_123','Что то');

execute ADD_DISCIPLINE('1-1101','Системное программирование');
execute ADD_DISCIPLINE('1-1101','Программирование в Internet');
execute ADD_DISCIPLINE('1-1102','Схемотехника');

execute ADD_LAB('Системное программирование','Агрегирование');
execute ADD_LAB('Системное программирование','Делегирование');
execute ADD_LAB('Системное программирование','COM EXE');
execute ADD_LAB('Программирование в Internet','Сервлет');
execute ADD_LAB('Программирование в Internet','AJAX');
execute ADD_LAB('Схемотехника','ShemBuilder');

execute ADD_GROUP('1-1101',2013,1);
execute ADD_GROUP('1-1101',2013,2);
execute ADD_GROUP('1-1102',2013,1);
execute ADD_GROUP('1-1102',2013,2);
execute ADD_GROUP('1-1105',2013,1);
execute ADD_GROUP('1-1103',2014,1);
execute ADD_GROUP('1-1103',2014,2);
execute ADD_GROUP('1-1104',2012,1);

execute ADD_SUBGROUP('1-1105',2013,1,1);
execute ADD_SUBGROUP('1-1101',2013,1,1);
execute ADD_SUBGROUP('1-1101',2013,1,2);
execute ADD_SUBGROUP('1-1101',2013,2,1);
execute ADD_SUBGROUP('1-1101',2013,2,2);
execute ADD_SUBGROUP('1-1102',2013,1,1);
execute ADD_SUBGROUP('1-1102',2013,2,1);

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

execute ADD_WORK('1-1101',2013,1,1,'Преподаватель2','Системное программирование');
execute ADD_WORK('1-1101',2013,1,1,'Преподаватель2','Программирование в Internet');
execute ADD_WORK('1-1101',2013,2,1,'Преподаватель1','Системное программирование');
execute ADD_WORK('1-1101',2013,2,1,'Преподаватель1','Программирование в Internet');
execute ADD_WORK('1-1102',2013,2,1,'Преподаватель3','Схемотехника');

execute SET_PROGRESS(1,'Преподаватель2',6,'Делегирование','Не сдано');
execute SET_PROGRESS(1,'Преподаватель2',6,'Делегирование','Сдано');
execute SET_PROGRESS(1,'Преподаватель2',2,'Делегирование','Сдано');
execute SET_PROGRESS(3,'Преподаватель3',7,'ShemBuilder','Сдано');
execute SET_PROGRESS(1,'Преподаватель2',2,'Агрегирование','Сдано');