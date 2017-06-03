--Добавление подгруппы
create or replace procedure ADD_SUBGROUP(
group_code "Группы"."Код_группы"%TYPE,
subgroup_number "Подгруппы"."Номер_подгруппы"%TYPE)
is
has_group integer;
valid integer;
begin
if (group_code IS NULL OR subgroup_number IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into has_group from "Группы" where "Код_группы" = group_code;
if has_group<>0 then
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
