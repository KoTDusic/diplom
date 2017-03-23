--Добавление специальности на факультет
create or replace procedure ADD_SPECIALITIS(
faculty_name "Факультет"."Название_факультета"%TYPE,
speciality_code "Специальность"."Код_специальности"%TYPE,
speciality_name "Специальность"."Имя_специальности"%TYPE)
is
valid integer;
begin
if (faculty_name IS NULL OR speciality_code IS NULL OR speciality_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Специальность" 
where "Код_факультета" = (select "Код_факультета" from "Факультет" where "Название_факультета"=faculty_name) AND
"Код_специальности" = speciality_code AND "Имя_специальности"=speciality_name;
if valid=0 then
INSERT INTO "Специальность"("Код_факультета","Код_специальности","Имя_специальности")
VALUES ((select "Код_факультета" from "Факультет" where "Название_факультета"=faculty_name),speciality_code,speciality_name);
else begin
  raise_application_error(-20001,'Ошибка, такая запись уже есть в базе');
  end;
end if;
commit;
end ADD_SPECIALITIS;