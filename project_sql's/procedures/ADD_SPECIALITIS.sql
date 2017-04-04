--Добавление специальности на факультет
create or replace procedure ADD_SPECIALITIS(
faculty_code "Факультет"."Код_факультета"%TYPE,
speciality_number "Специальность"."Номер_специальности"%TYPE,
speciality_name "Специальность"."Имя_специальности"%TYPE)
is
valid_faculty integer;
valid integer;
begin
if (faculty_code IS NULL OR speciality_number IS NULL OR speciality_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;

select count(*) into valid_faculty from "Факультет" where "Код_факультета"=faculty_code;
if valid_faculty=0 then
raise_application_error(-20001,'Факультета с кодом '||faculty_code||' не найдено');
end if;
select count(*) into valid from "Специальность" 
where "Код_факультета" = faculty_code 
AND "Имя_специальности" = speciality_name 
AND "Номер_специальности" = speciality_number;
if valid=0 then
INSERT INTO "Специальность"("Код_факультета","Номер_специальности","Имя_специальности")
VALUES (faculty_code,speciality_number,speciality_name);
else begin
  raise_application_error(-20001,'Ошибка, такая запись уже есть в базе');
  end;
end if;
commit;
end ADD_SPECIALITIS;


select * from "Специальность" 
where "Код_факультета" = 42
AND "Имя_специальности" = 'Химик-технолог' 
AND "Номер_специальности" = 11103;