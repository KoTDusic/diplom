--Удаление групп
create or replace procedure REMOVE_GROUP(
group_code "Группы"."Код_группы"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Группы" where "Группы"."Код_группы"=group_code;
if valid<>0 then
delete from "Группы" where "Код_группы" = group_code;
else begin
  raise_application_error(-20001,'Ошибка, такой записи нет в базе');
  end;
end if;
commit;
end REMOVE_GROUP;