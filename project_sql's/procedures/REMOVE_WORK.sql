--Удаление связи преподаватель-подгруппа-дисциплина
create or replace procedure REMOVE_WORK(
speciality_code "Группы"."Код_специальности"%TYPE,
age "Группы"."Год_поступления"%TYPE,
group_number "Группы"."Номер_группы"%TYPE,
subgroup_number "Подгруппы"."Номер_подгруппы"%TYPE,
teacher_name "Преподаватель"."ФИО"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE)
is 
valid integer;
group_kode number;
subgroup_kode number;
discipline_kode number;
teacher_kode number;
begin
--получение кода группы
select "Код_группы" into group_kode  from "Группы" where "Код_специальности" = speciality_code
AND "Год_поступления" = age AND "Номер_группы" = group_number;
--получение кода подгруппы
select "Код_подгруппы" into subgroup_kode from "Подгруппы" where "Номер_подгруппы" = subgroup_number AND "Код_группы" = group_kode;
--получение кода дисциплины
select "Код_дисциплины" into discipline_kode from "Дисциплина" where "Код_специальности" = speciality_code
AND "Наименование_дисциплины" = discipline_name;
--получение кода преподавателя
select "Код_преподавателя" into teacher_kode from "Преподаватель" where "ФИО" = teacher_name;
select count(*)into valid from "Нагрузка_преподавателя" 
where "Код_подгруппы" = subgroup_kode AND "Код_преподавателя" = teacher_kode AND "Код_дисциплины" = discipline_kode;
if valid<>0 then
delete "Нагрузка_преподавателя" where 
"Код_дисциплины"=discipline_kode AND "Код_подгруппы" = subgroup_kode AND "Код_преподавателя" = teacher_kode;
else begin
  raise_application_error(-20001,'Ошибка, такой записи нет в базе'||'group_kode='||group_kode||'subgroup_kode='||subgroup_kode||'discipline_kode='||discipline_kode||'teacher_kode='||teacher_kode);
  end;
end if;
end REMOVE_WORK;