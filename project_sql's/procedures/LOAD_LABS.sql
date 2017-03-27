create or replace procedure LOAD_LABS(
student_code "Студенты"."Код_студента"%TYPE)
is
discipline_code "Дисциплина"."Код_дисциплины"%TYPE;
teacher_name "Преподаватель"."ФИО"%TYPE;
lab_name "Лабораторные"."Название_лабораторной"%TYPE;
has_data number;
CURSOR get_disciplines IS
		select STUDENT_DISCIPLINE."Код_дисциплины","Преподаватель",
        "Название_лабораторной" from STUDENT_DISCIPLINE,"Лабораторные" 
        where "Лабораторные"."Код_дисциплины"=STUDENT_DISCIPLINE."Код_дисциплины" AND "Код_студента"=student_code;
begin
--discipline_code,teacher_name,student_code, lab_name, status 
        OPEN get_disciplines;
        FETCH get_disciplines INTO discipline_code, teacher_name,lab_name;
        
        WHILE get_disciplines%FOUND LOOP 
            select count(*) into has_data
            from "Успеваемость","Преподаватель","Лабораторные" where 
            "Лабораторные"."Номер_лабораторной"="Успеваемость"."Номер_лабораторной" AND
            "Преподаватель"."Код_преподавателя"="Успеваемость"."Код_преподавателя"
            AND "Успеваемость"."Код_дисциплины"=discipline_code
            AND "Преподаватель"."ФИО"=teacher_name
            AND "Успеваемость"."Код_студента"=student_code
            AND "Лабораторные"."Название_лабораторной"=lab_name;
            if has_data=0 then
                DBMS_OUTPUT.put_line('OutPutString is: '||TO_CHAR(discipline_code)||' '||teacher_name||' '||lab_name||' count = '||has_data);
                SET_PROGRESS(discipline_code,teacher_name,student_code,lab_name,'Не сдано');
            end if;
            FETCH get_disciplines INTO discipline_code, teacher_name,lab_name;
        END LOOP; 
    CLOSE get_disciplines;
    commit;
end LOAD_LABS;