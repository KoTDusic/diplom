--Изменение дисциплины  на специальности
create or replace procedure EDIT_DISCIPLINE(
speciality_code "Дисциплина"."Код_специальности"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE,
new_discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE
)
is 
valid integer;
valid_newvalue integer;
begin
if (speciality_code IS NULL OR discipline_name IS NULL OR new_discipline_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Дисциплина" where
"Код_специальности"=speciality_code AND "Наименование_дисциплины"=discipline_name;
select count(*) into valid_newvalue from "Дисциплина" where
"Код_специальности"=speciality_code AND "Наименование_дисциплины"=new_discipline_name;
if (valid_newvalue<>0) then
raise_application_error(-20001,'Невозможно переименовать, такая лабораторная уже есть');
end if;
if valid=1 then
update "Дисциплина" set "Наименование_дисциплины"=new_discipline_name where 
"Код_специальности"=speciality_code
AND "Наименование_дисциплины"=discipline_name;
else begin
  raise_application_error(-20001,'Ошибка, '||discipline_name||' нет в базе');
  end;
end if;
commit;
end EDIT_DISCIPLINE;