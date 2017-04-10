--Удаление дисциплины с специальности
create or replace procedure REMOVE_LAB(
lab_code "Лабораторные"."Код_лабораторной"%TYPE)
is 
valid integer;
begin
if (lab_code IS NULL) then
raise_application_error(-20001,'Неверные значения входных параметров');
end if;
select count(*) into valid from "Лабораторные" where "Код_лабораторной"=lab_code;
if valid<>0 then
delete from "Лабораторные" where "Код_лабораторной" = lab_code;
else begin
  raise_application_error(-20001,'Ошибка, такой лабораторной нет в базе');
  end;
end if;
commit;
end REMOVE_LAB;