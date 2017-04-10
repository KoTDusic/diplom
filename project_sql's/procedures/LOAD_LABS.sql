create or replace procedure LOAD_LABS(
student_code "Студенты"."Код_студента"%TYPE)
is
discipline_code "Дисциплина"."Код_дисциплины"%TYPE;
teacher_id "Преподаватель"."Код_преподавателя"%TYPE;
lab_name "Лабораторные"."Название_лабораторной"%TYPE;
has_data number;
CURSOR get_disciplines IS
		select STUDENT_DISCIPLINE."Код_дисциплины","Код_преподавателя",
        "Название_лабораторной" from STUDENT_DISCIPLINE,"Лабораторные" 
        where "Лабораторные"."Код_дисциплины"=STUDENT_DISCIPLINE."Код_дисциплины" AND "Код_студента"=student_code;
begin
--discipline_code,teacher_name,student_code, lab_name, status 
        OPEN get_disciplines;
        FETCH get_disciplines INTO discipline_code, teacher_id,lab_name;
        
        WHILE get_disciplines%FOUND LOOP 
            select count(*) into has_data
            from "Успеваемость","Преподаватель","Лабораторные" where 
            "Лабораторные"."Код_лабораторной"="Успеваемость"."Код_лабораторной" AND
            "Преподаватель"."Код_преподавателя"="Успеваемость"."Код_преподавателя"
            AND "Успеваемость"."Код_дисциплины"=discipline_code
            AND "Преподаватель"."Код_преподавателя"=teacher_id
            AND "Успеваемость"."Код_студента"=student_code
            AND "Лабораторные"."Название_лабораторной"=lab_name;
            if has_data=0 then
                DBMS_OUTPUT.put_line('OutPutString is: '||TO_CHAR(discipline_code)||' '||teacher_id||' '||lab_name||' count = '||has_data);
                SET_PROGRESS(discipline_code,teacher_id,student_code,lab_name,'Не сдано');
            end if;
            FETCH get_disciplines INTO discipline_code, teacher_id,lab_name;
        END LOOP; 
    CLOSE get_disciplines;
    commit;
end LOAD_LABS;