--Добавление/удаление строки успеваемости
create or replace procedure SET_PROGRESS(
speciality_code "Группы"."Код_специальности"%TYPE,
discipline_name "Дисциплина"."Наименование_дисциплины"%TYPE,
teacher_name "Преподаватель"."ФИО"%TYPE,
student_name "Студенты"."ФИО"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE,
status "Успеваемость"."Статус_сдачи"%TYPE)
is
discipline_code number;
lab_code number;
teacher_kode number;
student_kode number;
subgroup_kode number;
hasStr number;
Valid number;
begin
if (speciality_code IS NULL OR discipline_name IS NULL OR teacher_name IS NULL OR student_name IS NULL OR lab_name IS NULL OR status IS NULL) then
raise_application_error(-20001,'Неверные значения: speciality_code='||speciality_code||'discipline_name='||discipline_name||
'teacher_name='||teacher_name||
'student_name='||student_name||'lab_name='||lab_name||'status='||status);
end if;
--поиск кода дисциплины
select "Код_дисциплины" into discipline_code from "Дисциплина" 
where "Код_специальности" = speciality_code AND "Наименование_дисциплины" = discipline_name;
--поиск кода лабораторной
select "Номер_лабораторной" into lab_code from "Лабораторные" 
where "Код_дисциплины" = discipline_code AND "Название_лабораторной"=lab_name;
--поиск кода студента
select "Код_студента" into student_kode from "Студенты"
where "ФИО" = student_name;
--подгруппа студента
select "Код_подгруппы" into subgroup_kode from "Студенты"
where "ФИО" = student_name;
--поиск кода преподавателя
select "Код_преподавателя" into teacher_kode from "Преподаватель"
where "ФИО" = teacher_name;
--проверка, нужно добавить новую запись, или изменить существующую
select count(*) into hasStr from "Успеваемость" 
where "Код_дисциплины"=discipline_code AND "Код_преподавателя"=teacher_kode
AND "Номер_лабораторной"=lab_code AND "Код_студента"=student_kode;
--проверка, преподаёт ли преподаватель эту дисциплину у этой подгруппы
select count(*) into Valid from "Нагрузка_преподавателя"
where "Код_подгруппы" = subgroup_kode AND "Код_преподавателя" = teacher_kode 
AND "Код_дисциплины" = discipline_code;
if Valid<>0 then
  if hasStr=0 then
  insert into "Успеваемость" values(discipline_code,teacher_kode,lab_code,student_kode,status);
  else update "Успеваемость" set "Статус_сдачи" = status
  where "Код_дисциплины"=discipline_code AND "Код_преподавателя"=teacher_kode
  AND "Номер_лабораторной"=lab_code AND "Код_студента"=student_kode;
  end if;
  else begin
  raise_application_error(-20001,'Ошибка, этот преподаватель не преподаёт эту дисциплину у этой подгруппы');
  end;
end if;
end SET_PROGRESS;
