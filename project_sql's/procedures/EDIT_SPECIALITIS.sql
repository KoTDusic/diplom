--Редактирование специальности
create or replace procedure EDIT_SPECIALITIS(
faculty_name "Факультет"."Название_факультета"%TYPE,
speciality_code "Специальность"."Код_специальности"%TYPE,
new_speciality_name "Специальность"."Имя_специальности"%TYPE)
is
valid integer;
faculty_code "Факультет"."Код_факультета"%TYPE;
begin
if (faculty_name IS NULL OR speciality_code IS NULL OR new_speciality_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select "Код_факультета" into faculty_code from "Факультет" where "Название_факультета"=faculty_name;
select count(*) into valid from "Специальность" 
where "Код_факультета" = faculty_code AND
"Код_специальности" = speciality_code;
if valid<>0 then
update "Специальность" set "Имя_специальности"=new_speciality_name where "Код_специальности" = speciality_code;
else begin
  raise_application_error(-20001,'Ошибка, специальности с кодом '||speciality_code||' не найдено');
  end;
end if;
commit;
end EDIT_SPECIALITIS;