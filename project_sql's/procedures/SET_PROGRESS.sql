create or replace procedure SET_PROGRESS(
discipline_code "Дисциплина"."Код_дисциплины"%TYPE,
teacher_name "Преподаватель"."ФИО"%TYPE,
student_code "Студенты"."Код_студента"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE,
status "Успеваемость"."Статус_сдачи"%TYPE)
is
LabRows number;
ValidTeacher number;
lab_code number;
teacher_code nvarchar2(50);
begin
select count(*) into ValidTeacher from "Нагрузка_преподавателя","Студенты","Преподаватель"
where "Нагрузка_преподавателя"."Код_подгруппы"="Студенты"."Код_подгруппы" 
AND "Нагрузка_преподавателя"."Код_преподавателя"="Преподаватель"."Код_преподавателя" AND "Код_студента"=student_code
AND "Преподаватель"."ФИО"=teacher_name AND "Нагрузка_преподавателя"."Код_дисциплины"=discipline_code;
if ValidTeacher<>0 then
  begin
    select count(*) into LabRows from "Успеваемость","Лабораторные" where "Успеваемость"."Код_дисциплины"="Лабораторные"."Код_дисциплины"
    AND "Успеваемость"."Код_дисциплины"=discipline_code AND "Код_студента"=student_code AND "Название_лабораторной"=lab_name;
    select "Номер_лабораторной" into lab_code from "Лабораторные" where "Код_дисциплины"=discipline_code AND "Название_лабораторной"=lab_name;
    select "Код_преподавателя" into teacher_code from "Преподаватель" where "ФИО"=teacher_name;
    if LabRows<>0 then
      begin
        update "Успеваемость" set "Статус_сдачи" = status 
        where "Код_дисциплины"=discipline_code AND "Номер_лабораторной"=lab_code AND "Код_студента"=student_code;
      end;
    else 
      begin
        insert into "Успеваемость" values(discipline_code,teacher_code,lab_code,student_code,status);
      end;
    end if;
  end;
else 
  begin
    raise_application_error(-20001,'Ошибка, этот преподаватель не преподаёт эту дисциплину у этого студента');
  end;
end if;
commit;
end SET_PROGRESS;