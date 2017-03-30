--Добавление дисциплины  на специальность
create or replace procedure ADD_LAB(
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE)
is 
valid integer;
kod integer;
subgroup_kod integer;
CURSOR get_subgroups IS select "Код_подгруппы" from "Нагрузка_преподавателя" where "Код_дисциплины"=kod;
begin
if (discipline_name IS NULL OR lab_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select "Код_дисциплины" into kod from "Дисциплина" where "Наименование_дисциплины"=discipline_name;
select count(*) into valid from "Лабораторные" where "Код_дисциплины"=kod AND "Название_лабораторной"=lab_name;
if valid=0 then
DBMS_OUTPUT.PUT_LINE(kod||'  '||lab_name);
INSERT INTO "Лабораторные"("Код_дисциплины","Название_лабораторной")
VALUES (kod, lab_name);
OPEN get_subgroups;
    FETCH get_subgroups INTO subgroup_kod;
    WHILE get_subgroups%FOUND LOOP 
        LOAD_LABS_SUBGROUP(subgroup_kod);
        FETCH get_subgroups INTO subgroup_kod;
    END LOOP; 
CLOSE get_subgroups;
else begin
  raise_application_error(-20001,'Ошибка, такая лабораторная уже есть в базе');
  end;
end if;
commit;
end ADD_LAB;