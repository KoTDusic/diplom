--�������� ����� �������������-���������-����������
create or replace procedure REMOVE_WORK(
speciality_code "������"."���_�������������"%TYPE,
age "������"."���_�����������"%TYPE,
group_number "������"."�����_������"%TYPE,
subgroup_number "���������"."�����_���������"%TYPE,
teacher_name "�������������"."���"%TYPE,
discipline_name "����������"."������������_����������"%TYPE)
is 
valid integer;
group_kode number;
subgroup_kode number;
discipline_kode number;
teacher_kode number;
begin
--��������� ���� ������
select "���_������" into group_kode  from "������" where "���_�������������" = speciality_code
AND "���_�����������" = age AND "�����_������" = group_number;
--��������� ���� ���������
select "���_���������" into subgroup_kode from "���������" where "�����_���������" = subgroup_number AND "���_������" = group_kode;
--��������� ���� ����������
select "���_����������" into discipline_kode from "����������" where "���_�������������" = speciality_code
AND "������������_����������" = discipline_name;
--��������� ���� �������������
select "���_�������������" into teacher_kode from "�������������" where "���" = teacher_name;
select count(*)into valid from "��������_�������������" 
where "���_���������" = subgroup_kode AND "���_�������������" = teacher_kode AND "���_����������" = discipline_kode;
if valid<>0 then
delete "��������_�������������" where 
"���_����������"=discipline_kode AND "���_���������" = subgroup_kode AND "���_�������������" = teacher_kode;
else begin
  raise_application_error(-20001,'������, ����� ������ ��� � ����'||'group_kode='||group_kode||'subgroup_kode='||subgroup_kode||'discipline_kode='||discipline_kode||'teacher_kode='||teacher_kode);
  end;
end if;
end REMOVE_WORK;