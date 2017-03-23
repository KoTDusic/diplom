--Добавление факультета
create or replace procedure ADD_FACULTY(new_faculty "Факультет"."Название_факультета"%TYPE)
is
valid integer;
begin
if (new_faculty IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Факультет" where "Название_факультета"=new_faculty;
if valid=0 then
  INSERT INTO "Факультет"("Название_факультета") VALUES (new_faculty);
else begin
  raise_application_error(-20001,'Ошибка, такой факультет уже существует');
  end;
end if;
commit;
end ADD_FACULTY;