--Редактирование специальности
create or replace procedure EDIT_SPECIALITIS(
faculty_code "Факультет"."Код_факультета"%TYPE,
speciality_code "Специальность"."Код_специальности"%TYPE,
new_speciality_number "Специальность"."Номер_специальности"%TYPE,
new_speciality_name "Специальность"."Имя_специальности"%TYPE)
is
valid_faculty integer;
valid integer;
begin
if (faculty_code IS NULL OR speciality_code IS NULL OR new_speciality_number IS NULL OR new_speciality_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid_faculty from "Факультет" where "Код_факультета"=faculty_code;
if valid_faculty=0 then
raise_application_error(-20001,'Факультета с кодом '||faculty_code||' не найдено');
end if;
select count(*) into valid from "Специальность" 
where "Код_факультета" = faculty_code AND
"Код_специальности" = speciality_code;
if valid<>0 then
update "Специальность" set "Имя_специальности"=new_speciality_name, "Номер_специальности"=new_speciality_number
where "Код_специальности" = speciality_code;
else begin
  raise_application_error(-20001,'Ошибка, специальности с кодом '||speciality_code||' не найдено');
  end;
end if;
commit;
end EDIT_SPECIALITIS;