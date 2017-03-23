--Добавление преподавателей
create or replace procedure ADD_TEACHER(fio "Преподаватель"."ФИО"%TYPE, identificator "Преподаватель"."Код_преподавателя"%TYPE)
is
valid integer;
begin
if (fio IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Преподаватель" where "ФИО"=fio OR "Код_преподавателя"=identificator;
if valid=0 then
INSERT INTO "Преподаватель"("Код_преподавателя","ФИО") VALUES (identificator, fio);
else begin
  raise_application_error(-20001,'Ошибка, такой преподаватель уже есть в базе');
  end;
end if;
commit;
end ADD_TEACHER;