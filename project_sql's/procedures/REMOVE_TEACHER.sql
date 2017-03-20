--Удаление преподавателей
create or replace procedure REMOVE_TEACHER(fio "Преподаватель"."ФИО"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Преподаватель" where "ФИО"=fio;
if valid<>0 then
delete from "Преподаватель" where "ФИО" = fio;
else begin
  raise_application_error(-20001,'Ошибка, такого преподавателя нет в базе');
  end;
end if;
end REMOVE_TEACHER;