create or replace procedure SET_PROGRESS(
discipline_code "����������"."���_����������"%TYPE,
teacher_code "�������������"."���_�������������"%TYPE,
student_code "��������"."���_��������"%TYPE,
lab_name "������������"."��������_������������"%TYPE,
status "������������"."������_�����"%TYPE)
is
LabRows number;
ValidTeacher number;
lab_code number;
begin
select count(*) into ValidTeacher from "��������_�������������"
left join "���������" on "���������"."���_���������" = "��������_�������������"."���_���������"
left join "��������" on "���������"."���_���������"="��������"."���_���������"  where "���_��������"=student_code
AND "���_�������������"=teacher_code AND"���_����������"=discipline_code;
DBMS_OUTPUT.put_line('ValidTeacher is: '||TO_CHAR(ValidTeacher));
DBMS_OUTPUT.put_line('teacher_code is: '||TO_CHAR(teacher_code));
DBMS_OUTPUT.put_line('discipline_code is: '||TO_CHAR(discipline_code));
if ValidTeacher<>0 then
  begin
    select count(*) into LabRows from "������������","������������","�������������"
    where "������������"."���_������������"="������������"."���_������������"
    AND"�������������"."���_�������������"="������������"."���_�������������"
    AND "�������������"."���_�������������"=teacher_code
    AND "������������"."��������_������������"=lab_name
    AND "������������"."���_����������"=discipline_code
    AND "������������"."���_��������"=student_code;
    select "���_������������" into lab_code from "������������" where "���_����������"=discipline_code AND "��������_������������"=lab_name;
    --DBMS_OUTPUT.put_line('LabRows is: '||TO_CHAR(LabRows));
    if LabRows<>0 then
      begin
        update "������������" set "������_�����" = status 
        where "���_����������"=discipline_code AND "���_������������"=lab_code AND "���_��������"=student_code;
      end;
    else 
      begin
        insert into "������������"("���_����������","���_�������������","���_������������","���_��������","������_�����") 
        values(discipline_code,teacher_code,lab_code,student_code,status);
      end;
    end if;
  end;
else 
  begin
    raise_application_error(-20001,'������, ���� ������������� �� �������� ��� ���������� � ����� ��������');
  end;
end if;
commit;
end SET_PROGRESS;



