--����������/�������� ���������
create or replace procedure ADD_STUDENT(
subgroup_code "���������"."���_���������"%TYPE,
student_name "��������"."���"%TYPE)
is
valid integer;
valid_subgroup number;
student_code integer;
begin
if (subgroup_code IS NULL OR student_name IS NULL) then
raise_application_error(-20001,'�������� �������� ������� ����������');
end if;
--��������� ���� ���������
select "���_���������" into valid_subgroup from "���������" where "���_���������" = subgroup_code;
if valid_subgroup=0 then
raise_application_error(-20001,'������, ����� ������/��������� �� ����������');
end if;
select count(*) into valid from "��������" where "���"=student_name AND "���_���������" = subgroup_code;
if valid=0 then
INSERT INTO "��������"("���_���������","���") VALUES (subgroup_code,student_name);
select "���_��������" into student_code from "��������" where "���_���������"=subgroup_code AND "���"=student_name;
LOAD_LABS(student_code);
else begin
  raise_application_error(-20001,'������, ����� ������� ��� ���� � ����');
  end;
end if;
commit;
end ADD_STUDENT;