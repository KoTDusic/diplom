--Добавление связи преподаватель-подгруппа-дисциплина
create or replace procedure ADD_WORK(
subgroup_kode "Подгруппы"."Код_подгруппы"%TYPE,
teacher_kode "Преподаватель"."Код_преподавателя"%TYPE,
discipline_code "Дисциплина"."Код_дисциплины"%TYPE)
is 
valid integer;
valid_discipline integer;
valid_subgroup_discipline integer;
begin
if (subgroup_kode IS NULL OR teacher_kode IS NULL OR discipline_code IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;

--проверка наличия дисциплины с таким кодом
select count(*) into valid_discipline from "Дисциплина" where "Код_дисциплины"=discipline_code;
if valid_discipline=0
    then
    raise_application_error(-20001,'не найдено дисциплины с кодом '||discipline_code);
    end if;
--проверка наличия записи о нагрузке преподавателя
select count(*)into valid from "Нагрузка_преподавателя" 
where "Код_подгруппы" = subgroup_kode AND "Код_дисциплины" = discipline_code;
if valid=1
    then
    raise_application_error(-20001,'Ошибка, у подгруппы с кодом '||subgroup_kode||' уже назначен преподаватель');
    end if;
--проверка принадлежности дисциплины специальности подгруппы 
select count(*) into valid_subgroup_discipline from "Подгруппы"
left join "Группы" on "Подгруппы"."Код_группы"="Группы"."Код_группы" 
left join "Дисциплина" on "Дисциплина"."Код_специальности" = "Группы"."Код_специальности" 
where "Код_подгруппы"=subgroup_kode AND "Код_дисциплины" = discipline_code;
if valid_subgroup_discipline=0 then
    raise_application_error(-20001,'Ошибка, у этой подгруппы нет заданной дисциплины');
end if;
INSERT INTO "Нагрузка_преподавателя"("Код_подгруппы","Код_преподавателя","Код_дисциплины") 
values(subgroup_kode,teacher_kode,discipline_code);
commit;
end ADD_WORK;


