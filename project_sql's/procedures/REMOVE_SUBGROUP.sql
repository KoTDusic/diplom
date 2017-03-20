--Удаление подгрупп
create or replace procedure REMOVE_SUBGROUP(
speciality_code "Группы"."Код_специальности"%TYPE,
age "Группы"."Год_поступления"%TYPE,
group_number "Группы"."Номер_группы"%TYPE,
subgroup_number "Подгруппы"."Номер_подгруппы"%TYPE)
is
group_code integer;
valid integer;
begin
select "Код_группы" into group_code from "Группы" 
where "Код_специальности" = speciality_code AND "Год_поступления" = age AND "Номер_группы" = group_number;
if group_code<>0 then
select count(*) into valid from "Подгруппы" where "Код_группы"=group_code AND "Номер_подгруппы" = subgroup_number;
if valid<>0 then
delete from "Подгруппы" where "Номер_подгруппы" = subgroup_number AND "Код_группы"=group_code;
else begin
  raise_application_error(-20001,'Ошибка, такая подгруппа не существует');
  end;
end if;
else begin
  raise_application_error(-20001,'Ошибка, в базе нет такой группы');
  end;
end if;
end REMOVE_SUBGROUP;
