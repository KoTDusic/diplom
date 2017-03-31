--Удаление связи преподаватель-подгруппа-дисциплина
create or replace procedure REMOVE_WORK(
subgroup_kode "Подгруппы"."Код_подгруппы"%TYPE,
teacher_name "Преподаватель"."ФИО"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE)
is 
valid integer;
discipline_kode number;
teacher_kode nvarchar2(50);
begin
if (subgroup_kode IS NULL OR teacher_name IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
--получение кода дисциплины
select "Код_дисциплины" into discipline_kode from "Подгруппы","Группы","Дисциплина" where "Подгруппы"."Код_группы" = "Группы"."Код_группы"
AND "Дисциплина"."Код_специальности"="Группы"."Код_специальности" AND "Код_подгруппы"=subgroup_kode AND "Наименование_дисциплины"=discipline_name;
--получение кода преподавателя
select "Код_преподавателя" into teacher_kode from "Преподаватель" where "ФИО" = teacher_name;
--проверка наличия записи
select count(*)into valid from "Нагрузка_преподавателя" 
where "Код_подгруппы" = subgroup_kode AND "Код_преподавателя" = teacher_kode AND "Код_дисциплины" = discipline_kode;
if valid<>0 then
delete "Нагрузка_преподавателя" where 
"Код_дисциплины"=discipline_kode AND "Код_подгруппы" = subgroup_kode AND "Код_преподавателя" = teacher_kode;
else begin
    raise_application_error(-20001,'Ошибка, такой записи нет в базе'||'subgroup_kode='||subgroup_kode||'discipline_kode='||discipline_kode||'teacher_kode='||teacher_kode);
  end;
end if;
commit;
end REMOVE_WORK;