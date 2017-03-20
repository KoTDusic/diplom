--�������� ��������
create or replace procedure REMOVE_SUBGROUP(
speciality_code "������"."���_�������������"%TYPE,
age "������"."���_�����������"%TYPE,
group_number "������"."�����_������"%TYPE,
subgroup_number "���������"."�����_���������"%TYPE)
is
group_code integer;
valid integer;
begin
select "���_������" into group_code from "������" 
where "���_�������������" = speciality_code AND "���_�����������" = age AND "�����_������" = group_number;
if group_code<>0 then
select count(*) into valid from "���������" where "���_������"=group_code AND "�����_���������" = subgroup_number;
if valid<>0 then
delete from "���������" where "�����_���������" = subgroup_number AND "���_������"=group_code;
else begin
  raise_application_error(-20001,'������, ����� ��������� �� ����������');
  end;
end if;
else begin
  raise_application_error(-20001,'������, � ���� ��� ����� ������');
  end;
end if;
end REMOVE_SUBGROUP;
