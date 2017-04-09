--Удаление преподавателей
create or replace procedure EDIT_TEACHER(
new_fio "Преподаватель"."ФИО"%TYPE,
identificator "Преподаватель"."Код_преподавателя"%TYPE)
is
valid integer;
begin
if (new_fio IS NULL or identificator is null) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Преподаватель" where "Код_преподавателя"=identificator;
if valid=1 then
update "Преподаватель" set "ФИО"=new_fio where "Код_преподавателя" = identificator;
else begin
  raise_application_error(-20001,'Ошибка, такого преподавателя нет в базе');
  end;
end if;
commit;
end EDIT_TEACHER;