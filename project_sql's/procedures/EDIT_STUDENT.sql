--����������/�������� ���������
create or replace procedure EDIT_STUDENT(
student_code "��������"."���_��������"%TYPE,
new_student_name "��������"."���"%TYPE)
is
valid integer;
valid_subgroup number;
begin
if (student_code IS NULL OR new_student_name IS NULL) then
raise_application_error(-20001,'�������� �������� ������� ����������');
end if;
select count(*) into valid from "��������" where "���_��������"=student_code;
if valid=1 then
update "��������" set "���"= new_student_name where "���_��������" = student_code;
else begin
  raise_application_error(-20001,'������, �������� � ����� '||student_code||' ��� � ����');
  end;
end if;
commit;
end EDIT_STUDENT;