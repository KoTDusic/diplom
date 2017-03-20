--Удаление групп
create or replace procedure REMOVE_GROUP(
speciality_code "Группы"."Код_специальности"%TYPE,
age "Группы"."Год_поступления"%TYPE,
group_number "Группы"."Номер_группы"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Группы" 
where "Группы"."Код_специальности"=speciality_code AND
"Группы"."Год_поступления" = age AND
"Группы"."Номер_группы" = group_number;
if valid<>0 then
delete from "Группы" where "Код_специальности" = speciality_code
AND "Год_поступления" = age
AND "Номер_группы" = group_number;
else begin
  raise_application_error(-20001,'Ошибка, такой записи нет в базе');
  end;
end if;
end REMOVE_GROUP;