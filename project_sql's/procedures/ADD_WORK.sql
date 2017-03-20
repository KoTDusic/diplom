--Добавление связи преподаватель-подгруппа-дисциплина
create or replace procedure ADD_WORK(
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
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL OR subgroup_number IS NULL OR teacher_name IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
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
if valid=0 then
INSERT INTO "Нагрузка_преподавателя"("Код_подгруппы","Код_преподавателя","Код_дисциплины") 
values(subgroup_kode,teacher_kode,discipline_kode);
else begin
  raise_application_error(-20001,'Ошибка, такая запись уже есть');
  end;
end if;
end ADD_WORK;
