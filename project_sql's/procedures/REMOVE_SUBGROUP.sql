--�������� ��������
create or replace procedure REMOVE_SUBGROUP(
subgroup_code "���������"."���_���������"%TYPE
)
is
has_subgroup integer;
begin
if (subgroup_code IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into has_subgroup from "���������" where "���_���������" = subgroup_code;
if has_subgroup=1 then
delete from "���������" where "���_���������" = subgroup_code;
else begin
  raise_application_error(-20001,'������, � ���� ��� ��������� � id = '||subgroup_code);
  end;
end if;
commit;
end REMOVE_SUBGROUP;