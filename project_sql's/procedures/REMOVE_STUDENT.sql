--Удаление студентов
create or replace procedure REMOVE_STUDENT(
student_code "Студенты"."Код_студента"%TYPE)
is
valid integer;
begin
--получение кода подгруппы
select count(*)into valid from "Студенты" where "Код_студента" = student_code;
if valid=1 then
delete from "Студенты" where "Код_студента" = student_code;
else begin
  raise_application_error(-20001,'Ошибка, такой записи нет в базе');
  end;
end if;
commit;
end REMOVE_STUDENT;