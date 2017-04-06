--Добавление/удаление студентов
create or replace procedure ADD_STUDENT(
subgroup_code "Подгруппы"."Код_подгруппы"%TYPE,
student_name "Студенты"."ФИО"%TYPE)
is
valid integer;
valid_subgroup number;
student_code integer;
begin
if (subgroup_code IS NULL OR student_name IS NULL) then
raise_application_error(-20001,'Неверные значения входных параметров');
end if;
--получение кода подгруппы
select "Код_подгруппы" into valid_subgroup from "Подгруппы" where "Код_подгруппы" = subgroup_code;
if valid_subgroup=0 then
raise_application_error(-20001,'Ошибка, такой группы/подгруппы не существует');
end if;
select count(*) into valid from "Студенты" where "ФИО"=student_name AND "Код_подгруппы" = subgroup_code;
if valid=0 then
INSERT INTO "Студенты"("Код_подгруппы","ФИО") VALUES (subgroup_code,student_name);
select "Код_студента" into student_code from "Студенты" where "Код_подгруппы"=subgroup_code AND "ФИО"=student_name;
LOAD_LABS(student_code);
else begin
  raise_application_error(-20001,'Ошибка, такой студент уже есть в базе');
  end;
end if;
commit;
end ADD_STUDENT;