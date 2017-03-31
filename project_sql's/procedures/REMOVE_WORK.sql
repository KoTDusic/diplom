--�������� ����� �������������-���������-����������
create or replace procedure REMOVE_WORK(
subgroup_kode "���������"."���_���������"%TYPE,
teacher_name "�������������"."���"%TYPE,
discipline_name "����������"."������������_����������"%TYPE)
is 
valid integer;
discipline_kode number;
teacher_kode nvarchar2(50);
begin
if (subgroup_kode IS NULL OR teacher_name IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
--��������� ���� ����������
select "���_����������" into discipline_kode from "���������","������","����������" where "���������"."���_������" = "������"."���_������"
AND "����������"."���_�������������"="������"."���_�������������" AND "���_���������"=subgroup_kode AND "������������_����������"=discipline_name;
--��������� ���� �������������
select "���_�������������" into teacher_kode from "�������������" where "���" = teacher_name;
--�������� ������� ������
select count(*)into valid from "��������_�������������" 
where "���_���������" = subgroup_kode AND "���_�������������" = teacher_kode AND "���_����������" = discipline_kode;
if valid<>0 then
delete "��������_�������������" where 
"���_����������"=discipline_kode AND "���_���������" = subgroup_kode AND "���_�������������" = teacher_kode;
else begin
    raise_application_error(-20001,'������, ����� ������ ��� � ����'||'subgroup_kode='||subgroup_kode||'discipline_kode='||discipline_kode||'teacher_kode='||teacher_kode);
  end;
end if;
commit;
end REMOVE_WORK;