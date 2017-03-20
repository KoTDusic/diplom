--Добавление преподавателей
create or replace procedure ADD_TEACHER(fio "Преподаватель"."ФИО"%TYPE)
is
valid integer;
begin
if (fio IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Преподаватель" where "ФИО"=fio;
if valid=0 then
INSERT INTO "Преподаватель"("ФИО") VALUES (fio);
else begin
  raise_application_error(-20001,'Ошибка, такой преподаватель уже есть в базе');
  end;
end if;
end ADD_TEACHER;