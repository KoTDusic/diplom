--Изменение дисциплины  на специальности
create or replace procedure EDIT_DISCIPLINE(
speciality_code "Дисциплина"."Код_специальности"%TYPE,
new_discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE
)
is 
valid integer;
valid_newvalue integer;
begin
if (speciality_code IS NULL OR new_discipline_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Специальность" where "Код_специальности"=speciality_code;
select count(*) into valid_newvalue from "Дисциплина" where "Код_специальности"=speciality_code AND "Наименование_дисциплины"=new_discipline_name;

if (valid_newvalue<>0) then
raise_application_error(-20001,'Невозможно переименовать, такая дисциплина уже есть');
end if;
if valid=1 then
update "Дисциплина" set "Наименование_дисциплины"=new_discipline_name where "Код_специальности"=speciality_code;
else begin
  raise_application_error(-20001,'Ошибка, специальности с кодом '||speciality_code||' нет в базе');
  end;
end if;
commit;
end EDIT_DISCIPLINE;