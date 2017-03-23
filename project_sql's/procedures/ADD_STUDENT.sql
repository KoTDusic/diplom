--Добавление/удаление студентов
create or replace procedure ADD_STUDENT(
speciality_code "Группы"."Код_специальности"%TYPE,
age "Группы"."Год_поступления"%TYPE,
group_number "Группы"."Номер_группы"%TYPE,
subgroup_number "Подгруппы"."Номер_подгруппы"%TYPE,
student_name "Студенты"."ФИО"%TYPE)
is
valid integer;
group_kode number;
subgroup_kode number;
begin
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL OR subgroup_number IS NULL OR student_name IS NULL) then
raise_application_error(-20001,'Неверные значения'||speciality_code||age||group_number||subgroup_number||student_name);
end if;
--получение кода группы
select "Код_группы" into group_kode  from "Группы" where "Код_специальности" = speciality_code
AND "Год_поступления" = age AND "Номер_группы" = group_number;
--получение кода подгруппы
select "Код_подгруппы" into subgroup_kode from "Подгруппы" where "Номер_подгруппы" = subgroup_number AND "Код_группы" = group_kode;
if group_kode<>0 AND subgroup_kode<>0 then
select count(*) into valid from "Студенты" where "ФИО"=student_name AND "Код_подгруппы" = subgroup_kode;
if valid=0 then
INSERT INTO "Студенты"("Код_подгруппы","ФИО") VALUES (subgroup_kode,student_name);
else begin
  raise_application_error(-20001,'Ошибка, такой студент уже есть в базе');
  end;
end if;
else begin
  raise_application_error(-20001,'Ошибка, такой группы/подгруппы не существует');
  end;
end if;
commit;
end ADD_STUDENT;