create or replace procedure SET_PROGRESS(
discipline_code "Дисциплина"."Код_дисциплины"%TYPE,
teacher_code "Преподаватель"."Код_преподавателя"%TYPE,
student_code "Студенты"."Код_студента"%TYPE,
lab_name "Лабораторные"."Название_лабораторной"%TYPE,
status "Успеваемость"."Статус_сдачи"%TYPE)
is
LabRows number;
ValidTeacher number;
lab_code number;
begin
select count(*) into ValidTeacher from "Нагрузка_преподавателя"
left join "Подгруппы" on "Подгруппы"."Код_подгруппы" = "Нагрузка_преподавателя"."Код_подгруппы"
left join "Студенты" on "Подгруппы"."Код_подгруппы"="Студенты"."Код_подгруппы"  where "Код_студента"=student_code
AND "Код_преподавателя"=teacher_code AND"Код_дисциплины"=discipline_code;
DBMS_OUTPUT.put_line('ValidTeacher is: '||TO_CHAR(ValidTeacher));
DBMS_OUTPUT.put_line('teacher_code is: '||TO_CHAR(teacher_code));
DBMS_OUTPUT.put_line('discipline_code is: '||TO_CHAR(discipline_code));
if ValidTeacher<>0 then
  begin
    select count(*) into LabRows from "Успеваемость","Лабораторные","Преподаватель"
    where "Лабораторные"."Код_лабораторной"="Успеваемость"."Код_лабораторной"
    AND"Преподаватель"."Код_преподавателя"="Успеваемость"."Код_преподавателя"
    AND "Преподаватель"."Код_преподавателя"=teacher_code
    AND "Лабораторные"."Название_лабораторной"=lab_name
    AND "Успеваемость"."Код_дисциплины"=discipline_code
    AND "Успеваемость"."Код_студента"=student_code;
    select "Код_лабораторной" into lab_code from "Лабораторные" where "Код_дисциплины"=discipline_code AND "Название_лабораторной"=lab_name;
    --DBMS_OUTPUT.put_line('LabRows is: '||TO_CHAR(LabRows));
    if LabRows<>0 then
      begin
        update "Успеваемость" set "Статус_сдачи" = status 
        where "Код_дисциплины"=discipline_code AND "Код_лабораторной"=lab_code AND "Код_студента"=student_code;
      end;
    else 
      begin
        insert into "Успеваемость"("Код_дисциплины","Код_преподавателя","Код_лабораторной","Код_студента","Статус_сдачи") 
        values(discipline_code,teacher_code,lab_code,student_code,status);
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



