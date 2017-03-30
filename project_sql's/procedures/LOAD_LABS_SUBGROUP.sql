create or replace procedure LOAD_LABS_SUBGROUP(
subgroup_code "Нагрузка_преподавателя"."Код_подгруппы"%TYPE)
is
student_code "Студенты"."Код_студента"%TYPE;
CURSOR get_students IS select "Код_студента" from "Студенты" where "Код_подгруппы"=subgroup_code;
begin
--discipline_code,teacher_name,student_code, lab_name, status 
        OPEN get_students;
        FETCH get_students INTO student_code;
        
        WHILE get_students%FOUND LOOP 
            LOAD_LABS(student_code);
            FETCH get_students INTO student_code;
        END LOOP; 
    CLOSE get_students;
    commit;
end LOAD_LABS_SUBGROUP;