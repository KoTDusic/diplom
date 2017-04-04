--Удаление факультета
create or replace procedure REMOVE_FACULTY(
identifer "Факультет"."Код_факультета"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Факультет" where "Код_факультета"=identifer;
if valid<>0 then
delete from "Факультет" where "Код_факультета" = identifer;
else begin
  raise_application_error(-20001,'Ошибка, факультета с id'||identifer||' нет');
  end;
end if;
commit;
end REMOVE_FACULTY;