--Удаление факультета
create or replace procedure REMOVE_FACULTY(new_faculty "Факультет"."Название_факультета"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Факультет" where "Название_факультета"=new_faculty;
if valid<>0 then
delete from "Факультет" where "Название_факультета" = new_faculty;
else begin
  raise_application_error(-20001,'Ошибка, такого факультета нет');
  end;
end if;
end REMOVE_FACULTY;