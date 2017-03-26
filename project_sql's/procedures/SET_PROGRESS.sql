create or replace procedure SET_PROGRESS(
discipline_code "����������"."���_����������"%TYPE,
teacher_name "�������������"."���"%TYPE,
student_code "��������"."���_��������"%TYPE,
lab_name "������������"."��������_������������"%TYPE,
status "������������"."������_�����"%TYPE)
is
LabRows number;
ValidTeacher number;
lab_code number;
teacher_code nvarchar2(50);
begin
select count(*) into ValidTeacher from "��������_�������������","��������","�������������"
where "��������_�������������"."���_���������"="��������"."���_���������" 
AND "��������_�������������"."���_�������������"="�������������"."���_�������������" AND "���_��������"=student_code
AND "�������������"."���"=teacher_name AND "��������_�������������"."���_����������"=discipline_code;
if ValidTeacher<>0 then
  begin
    select count(*) into LabRows from "������������","������������" where "������������"."���_����������"="������������"."���_����������"
    AND "������������"."���_����������"=discipline_code AND "���_��������"=student_code AND "��������_������������"=lab_name;
    select "�����_������������" into lab_code from "������������" where "���_����������"=discipline_code AND "��������_������������"=lab_name;
    select "���_�������������" into teacher_code from "�������������" where "���"=teacher_name;
    if LabRows<>0 then
      begin
        update "������������" set "������_�����" = status 
        where "���_����������"=discipline_code AND "�����_������������"=lab_code AND "���_��������"=student_code;
      end;
    else 
      begin
        insert into "������������" values(discipline_code,teacher_code,lab_code,student_code,status);
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