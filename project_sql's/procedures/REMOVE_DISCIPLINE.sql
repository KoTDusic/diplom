--Удаление дисциплины с специальности
create or replace procedure REMOVE_DISCIPLINE(
speciality_code "Дисциплина"."Код_специальности"%TYPE,
speciality_name "Дисциплина"."Наименование_дисциплины"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Дисциплина" where
"Код_специальности" = speciality_code AND "Наименование_дисциплины" = speciality_name;
if valid<>0 then
delete from "Дисциплина" where speciality_code = "Код_специальности"
AND speciality_name = "Наименование_дисциплины";
else begin
  raise_application_error(-20001,'Ошибка, такой записи не существует');
  end;
end if;
commit;
end REMOVE_DISCIPLINE;