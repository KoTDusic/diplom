--Добавление дисциплины  на специальность
create or replace procedure ADD_DISCIPLINE(
speciality_code "Специальность"."Код_специальности"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE)
is 
valid_speciality integer;
valid integer;
begin
if (speciality_code IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid_speciality from "Специальность" where "Код_специальности"=speciality_code;
if valid_speciality=0 then
raise_application_error(-20001,'Специальности с кодом '||speciality_code||' не найдено');
end if;
select count(*) into valid from "Дисциплина" where
"Код_специальности"=speciality_code AND "Наименование_дисциплины"=discipline_name;
if valid=0 then
INSERT INTO "Дисциплина"("Код_специальности","Наименование_дисциплины")
VALUES (speciality_code, discipline_name);
else begin
  raise_application_error(-20001,'Ошибка, такая запись уже есть');
  end;
end if;
commit;
end ADD_DISCIPLINE;