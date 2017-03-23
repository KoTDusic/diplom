--Добавление дисциплины  на специальность
create or replace procedure ADD_DISCIPLINE(
speciality_code "Дисциплина"."Код_специальности"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE)
is 
valid integer;
begin
if (speciality_code IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Дисциплина" where
"Код_специальности"=LTRIM(RTRIM(speciality_code)) AND "Наименование_дисциплины"=LTRIM(RTRIM(discipline_name));
if valid=0 then
INSERT INTO "Дисциплина"("Код_специальности","Наименование_дисциплины")
VALUES (LTRIM(RTRIM(speciality_code)), LTRIM(RTRIM(discipline_name)));
else begin
  raise_application_error(-20001,'Ошибка, такая запись уже есть');
  end;
end if;
commit;
end ADD_DISCIPLINE;