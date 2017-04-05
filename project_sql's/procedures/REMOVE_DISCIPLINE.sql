--Удаление дисциплины с специальности
create or replace procedure REMOVE_DISCIPLINE(
discipline_code "Дисциплина"."Код_дисциплины"%TYPE
)
is
valid integer;
begin
select count(*) into valid from "Дисциплина" where "Код_дисциплины" = discipline_code;
if valid=1 then
delete from "Дисциплина" where "Код_дисциплины" = discipline_code;
else begin
  raise_application_error(-20001,'Ошибка, такой записи не существует');
  end;
end if;
commit;
end REMOVE_DISCIPLINE;