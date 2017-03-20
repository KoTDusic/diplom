--Удаление дисциплины с специальности
create or replace procedure REMOVE_LAB(
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE)
is 
valid integer;
begin
select count(*) into valid from "Лабораторные" where
"Код_дисциплины"=(select "Код_дисциплины" from "Дисциплина" where "Наименование_дисциплины"=discipline_name) AND "Название_лабораторной"=lab_name;
if valid<>0 then
delete from "Лабораторные" where "Название_лабораторной" = lab_name
AND "Код_дисциплины"=(select "Код_дисциплины" from "Дисциплина" where "Наименование_дисциплины" = discipline_name);
else begin
  raise_application_error(-20001,'Ошибка, такой лабораторной нет в базе');
  end;
end if;
end REMOVE_LAB;