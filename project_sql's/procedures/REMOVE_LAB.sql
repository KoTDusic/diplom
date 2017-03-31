--Удаление дисциплины с специальности
create or replace procedure REMOVE_LAB(
speciality_name "Специальность"."Имя_специальности"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE)
is 
valid integer;
kod integer;
begin
select "Код_дисциплины" into kod from "Специальность","Дисциплина" 
where "Специальность"."Код_специальности"="Дисциплина"."Код_специальности"
AND "Дисциплина"."Наименование_дисциплины"=discipline_name
AND "Специальность"."Имя_специальности"=speciality_name;
select count(*) into valid from "Лабораторные" where
"Код_дисциплины"=kod AND "Название_лабораторной"=lab_name;
if valid<>0 then
delete from "Лабораторные" where "Название_лабораторной" = lab_name
AND "Код_дисциплины"=kod;
else begin
  raise_application_error(-20001,'Ошибка, такой лабораторной нет в базе');
  end;
end if;
commit;
end REMOVE_LAB;