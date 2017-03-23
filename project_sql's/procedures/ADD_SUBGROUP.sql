--Добавление подгрупп
create or replace procedure ADD_SUBGROUP(
speciality_code "Группы"."Код_специальности"%TYPE,
age "Группы"."Год_поступления"%TYPE,
group_number "Группы"."Номер_группы"%TYPE,
subgroup_number "Подгруппы"."Номер_подгруппы"%TYPE)
is
group_code number;
valid integer;
begin
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL OR subgroup_number IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select "Код_группы" into group_code from "Группы" where "Код_специальности" = speciality_code AND "Год_поступления" = age AND "Номер_группы" = group_number;
if group_code<>0 then
select count(*) into valid from "Подгруппы" where "Код_группы"=group_code AND "Номер_подгруппы" = subgroup_number;
if valid=0 then
INSERT INTO "Подгруппы"("Код_группы","Номер_подгруппы") VALUES (group_code, subgroup_number);
else begin
  raise_application_error(-20001,'Ошибка, такая подгруппа уже существует');
  end;
end if;
else begin
  raise_application_error(-20001,'Ошибка, в базе нет такой группы');
  end;
end if;
commit;
end ADD_SUBGROUP;
