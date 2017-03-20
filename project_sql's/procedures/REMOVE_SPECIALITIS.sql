--Удаление специальности на факультет
create or replace procedure REMOVE_SPECIALITIS(
faculty_name "Факультет"."Название_факультета"%TYPE,
speciality_name "Специальность"."Имя_специальности"%TYPE)
is
valid integer;
begin
select count(*) into valid from "Специальность" 
where "Код_факультета" = (select "Код_факультета" from "Факультет" where "Название_факультета"=faculty_name)
AND "Имя_специальности"=speciality_name;
if valid<>0 then
delete from "Специальность" where 
"Код_факультета" = (select "Код_факультета" from "Факультет" where "Название_факультета" = faculty_name)
AND "Имя_специальности"=speciality_name;
else begin
  raise_application_error(-20001,'Ошибка, такой записи нет в базе');
  end;
end if;
end REMOVE_SPECIALITIS;