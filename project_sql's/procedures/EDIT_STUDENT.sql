--Добавление/удаление студентов
create or replace procedure EDIT_STUDENT(
student_code "Студенты"."Код_студента"%TYPE,
new_student_name "Студенты"."ФИО"%TYPE)
is
valid integer;
valid_subgroup number;
begin
if (student_code IS NULL OR new_student_name IS NULL) then
raise_application_error(-20001,'Неверные значения входных параметров');
end if;
select count(*) into valid from "Студенты" where "Код_студента"=student_code;
if valid=1 then
update "Студенты" set "ФИО"= new_student_name where "Код_студента" = student_code;
else begin
  raise_application_error(-20001,'Ошибка, студента с кодом '||student_code||' нет в базе');
  end;
end if;
commit;
end EDIT_STUDENT;