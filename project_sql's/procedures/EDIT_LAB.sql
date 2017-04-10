--Редактирование лабораторной
create or replace procedure EDIT_LAB(
lab_code "Лабораторные"."Код_лабораторной"%TYPE,
new_lab_name "Лабораторные"."Название_лабораторной"%TYPE)
is 
valid integer;
begin
if (new_lab_name IS NULL OR lab_code IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Лабораторные" where "Код_лабораторной"=lab_code;
if valid=1 then
update "Лабораторные" set "Название_лабораторной"=new_lab_name where "Код_лабораторной"=lab_code;
else begin
  raise_application_error(-20001,'Ошибка, лабораторной ск кодом '||lab_code||' нет в базе');
  end;
end if;
commit;
end EDIT_LAB;
