--Редактирование лабораторной
create or replace procedure EDIT_LAB(
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE,
new_lab_name "Лабораторные"."Название_лабораторной"%TYPE)
is 
valid integer;
kod integer;
begin
if (discipline_name IS NULL OR lab_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select "Код_дисциплины" into kod from "Дисциплина" where "Наименование_дисциплины"=discipline_name;
select count(*) into valid from "Лабораторные" where "Код_дисциплины"=kod AND "Название_лабораторной"=lab_name;
if valid=1 then
DBMS_OUTPUT.PUT_LINE(kod||'  '||lab_name);
update "Лабораторные" set "Название_лабораторной"=new_lab_name 
where "Название_лабораторной"=lab_name AND "Код_дисциплины"=kod;
else begin
  raise_application_error(-20001,'Ошибка, лабораторной '||lab_name||' нет в базе');
  end;
end if;
commit;
end EDIT_LAB;