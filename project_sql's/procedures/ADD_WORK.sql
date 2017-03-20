--���������� ����� �������������-���������-����������
create or replace procedure ADD_WORK(
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
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL OR subgroup_number IS NULL OR teacher_name IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
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
if valid=0 then
INSERT INTO "��������_�������������"("���_���������","���_�������������","���_����������") 
values(subgroup_kode,teacher_kode,discipline_kode);
else begin
  raise_application_error(-20001,'������, ����� ������ ��� ����');
  end;
end if;
end ADD_WORK;
