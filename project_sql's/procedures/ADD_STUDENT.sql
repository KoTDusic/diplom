--����������/�������� ���������
create or replace procedure ADD_STUDENT(
speciality_code "������"."���_�������������"%TYPE,
age "������"."���_�����������"%TYPE,
group_number "������"."�����_������"%TYPE,
subgroup_number "���������"."�����_���������"%TYPE,
student_name "��������"."���"%TYPE)
is
valid integer;
group_kode number;
subgroup_kode number;
begin
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL OR subgroup_number IS NULL OR student_name IS NULL) then
raise_application_error(-20001,'�������� ��������'||speciality_code||age||group_number||subgroup_number||student_name);
end if;
--��������� ���� ������
select "���_������" into group_kode  from "������" where "���_�������������" = speciality_code
AND "���_�����������" = age AND "�����_������" = group_number;
--��������� ���� ���������
select "���_���������" into subgroup_kode from "���������" where "�����_���������" = subgroup_number AND "���_������" = group_kode;
if group_kode<>0 AND subgroup_kode<>0 then
select count(*) into valid from "��������" where "���"=student_name AND "���_���������" = subgroup_kode;
if valid=0 then
INSERT INTO "��������"("���_���������","���") VALUES (subgroup_kode,student_name);
else begin
  raise_application_error(-20001,'������, ����� ������� ��� ���� � ����');
  end;
end if;
else begin
  raise_application_error(-20001,'������, ����� ������/��������� �� ����������');
  end;
end if;
commit;
end ADD_STUDENT;