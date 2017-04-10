create or replace procedure LOAD_LABS(
student_code "��������"."���_��������"%TYPE)
is
discipline_code "����������"."���_����������"%TYPE;
teacher_id "�������������"."���_�������������"%TYPE;
lab_name "������������"."��������_������������"%TYPE;
has_data number;
CURSOR get_disciplines IS
		select STUDENT_DISCIPLINE."���_����������","���_�������������",
        "��������_������������" from STUDENT_DISCIPLINE,"������������" 
        where "������������"."���_����������"=STUDENT_DISCIPLINE."���_����������" AND "���_��������"=student_code;
begin
--discipline_code,teacher_name,student_code, lab_name, status 
        OPEN get_disciplines;
        FETCH get_disciplines INTO discipline_code, teacher_id,lab_name;
        
        WHILE get_disciplines%FOUND LOOP 
            select count(*) into has_data
            from "������������","�������������","������������" where 
            "������������"."���_������������"="������������"."���_������������" AND
            "�������������"."���_�������������"="������������"."���_�������������"
            AND "������������"."���_����������"=discipline_code
            AND "�������������"."���_�������������"=teacher_id
            AND "������������"."���_��������"=student_code
            AND "������������"."��������_������������"=lab_name;
            if has_data=0 then
                DBMS_OUTPUT.put_line('OutPutString is: '||TO_CHAR(discipline_code)||' '||teacher_id||' '||lab_name||' count = '||has_data);
                SET_PROGRESS(discipline_code,teacher_id,student_code,lab_name,'�� �����');
            end if;
            FETCH get_disciplines INTO discipline_code, teacher_id,lab_name;
        END LOOP; 
    CLOSE get_disciplines;
    commit;
end LOAD_LABS;