--�������� ���������
create or replace procedure REMOVE_STUDENT(
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
--��������� ���� ������
select "���_������" into group_kode  from "������" where "���_�������������" = speciality_code
AND "���_�����������" = age AND "�����_������" = group_number;
--��������� ���� ���������
select "���_���������" into subgroup_kode from "���������" where "�����_���������" = subgroup_number AND "���_������" = group_kode;
select count(*)into valid from "��������" where "���" = student_name AND "���_���������" = subgroup_kode;
if valid<>0 then
delete from "��������" where "���" = student_name AND "���_���������" = subgroup_kode;
else begin
  raise_application_error(-20001,'������, ����� ������ ��� � ����');
  end;
end if;
commit;
end REMOVE_STUDENT;