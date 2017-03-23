--Удаление преподавателей
create or replace procedure REMOVE_TEACHER(identificator "Преподаватель"."Код_преподавателя"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Преподаватель" where "Код_преподавателя"=identificator;
if valid<>0 then
delete from "Преподаватель" where "Код_преподавателя" = identificator;
else begin
  raise_application_error(-20001,'Ошибка, такого преподавателя нет в базе');
  end;
end if;
commit;
end REMOVE_TEACHER;