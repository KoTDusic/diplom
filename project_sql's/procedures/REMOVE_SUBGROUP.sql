--�������� ��������
create or replace procedure REMOVE_SUBGROUP(
group_code "������"."���_������"%TYPE,
subgroup_number "���������"."�����_���������"%TYPE)
is
has_group integer;
valid integer;
begin
if (group_code IS NULL OR subgroup_number IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into has_group from "������" where "���_������" = group_code;
if has_group=1 then
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
commit;
end REMOVE_SUBGROUP;
