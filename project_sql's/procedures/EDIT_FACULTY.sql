--Редактирование факультета
create or replace procedure EDIT_FACULTY(
identifer "Факультет"."Код_факультета"%TYPE,
new_name "Факультет"."Название_факультета"%TYPE)
is
valid integer;
begin
if (new_name IS NULL or identifer is null) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Факультет" where "Код_факультета"=identifer;
if valid<>0 then
update "Факультет" set "Название_факультета"=new_name where "Код_факультета"=identifer;
else begin
  raise_application_error(-20001,'Ошибка, факультет c id'||identifer||' не найден в бд');
  end;
end if;
commit;
end EDIT_FACULTY;