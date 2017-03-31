--Добавление связи преподаватель-подгруппа-дисциплина
create or replace procedure ADD_WORK(
subgroup_kode "Подгруппы"."Код_подгруппы"%TYPE,
teacher_name "Преподаватель"."ФИО"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE)
is 
valid integer;
kod integer;
valid_discipline integer;
teacher_kode nvarchar2(50);
begin
if (subgroup_kode IS NULL OR teacher_name IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
--получение кода преподавателя
select "Код_преподавателя" into teacher_kode from "Преподаватель" where "ФИО" = teacher_name;

--проверка принадлежности дисциплины специальности подгруппы
select count(*) into valid_discipline from "Подгруппы","Группы","Дисциплина" where "Подгруппы"."Код_группы" = "Группы"."Код_группы"
AND "Дисциплина"."Код_специальности"="Группы"."Код_специальности" AND "Код_подгруппы"=subgroup_kode AND "Наименование_дисциплины"=discipline_name;
--проверка кода дисциплины
select "Код_дисциплины" into kod from "Подгруппы","Группы","Дисциплина" where "Подгруппы"."Код_группы" = "Группы"."Код_группы"
AND "Дисциплина"."Код_специальности"="Группы"."Код_специальности" AND "Код_подгруппы"=subgroup_kode AND "Наименование_дисциплины"=discipline_name;
--проверка наличия записи
select count(*)into valid from "Нагрузка_преподавателя" 
where "Код_подгруппы" = subgroup_kode AND "Код_преподавателя" = teacher_kode AND "Код_дисциплины" = kod;
if valid=0
    then
        if valid_discipline<>0
            then
                INSERT INTO "Нагрузка_преподавателя"("Код_подгруппы","Код_преподавателя","Код_дисциплины") 
                values(subgroup_kode,teacher_kode,kod);
            else begin
                raise_application_error(-20001,'Ошибка, у этой подгруппы нет заданной дисциплины');
            end;
        end if;
    else begin
      raise_application_error(-20001,'Ошибка, такая запись уже есть');
    end;
end if;
commit;
end ADD_WORK;