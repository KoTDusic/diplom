--Удаление подгрупп
create or replace procedure REMOVE_SUBGROUP(
subgroup_code "Подгруппы"."Код_подгруппы"%TYPE
)
is
has_subgroup integer;
begin
if (subgroup_code IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into has_subgroup from "Подгруппы" where "Код_подгруппы" = subgroup_code;
if has_subgroup=1 then
delete from "Подгруппы" where "Код_подгруппы" = subgroup_code;
else begin
  raise_application_error(-20001,'Ошибка, в базе нет подгруппы с id = '||subgroup_code);
  end;
end if;
commit;
end REMOVE_SUBGROUP;