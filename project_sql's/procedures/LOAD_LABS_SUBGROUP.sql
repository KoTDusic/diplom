create or replace procedure LOAD_LABS_SUBGROUP(
subgroup_code "��������_�������������"."���_���������"%TYPE)
is
student_code "��������"."���_��������"%TYPE;
CURSOR get_students IS select "���_��������" from "��������" where "���_���������"=subgroup_code;
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