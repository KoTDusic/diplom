--Добавление дисциплины  на специальность
create or replace procedure ADD_LAB(
discipline_id "Дисциплина"."Код_дисциплины"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE)
is 
valid integer;
kod integer;
subgroup_kod integer;
CURSOR get_subgroups IS select "Код_подгруппы" from "Нагрузка_преподавателя" where "Код_дисциплины"=discipline_id;
begin
if (discipline_id IS NULL OR lab_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Лабораторные" where "Код_дисциплины"=discipline_id AND "Название_лабораторной"=lab_name;
if valid=0 then
DBMS_OUTPUT.PUT_LINE(discipline_id||'  '||lab_name);
INSERT INTO "Лабораторные"("Код_дисциплины","Название_лабораторной")
VALUES (discipline_id, lab_name);
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