--Редактирование факультета
create or replace procedure EDIT_FACULTY(
old_name "Факультет"."Название_факультета"%TYPE,
new_name "Факультет"."Название_факультета"%TYPE)
is
valid integer;
begin
if (new_name IS NULL or old_name is null) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Факультет" where "Название_факультета"=old_name;
if valid<>0 then
update "Факультет" set "Название_факультета"=new_name where "Название_факультета"=old_name;
else begin
  raise_application_error(-20001,'Ошибка, факультет '||old_name||' не найден в бд');
  end;
end if;
commit;
end EDIT_FACULTY;