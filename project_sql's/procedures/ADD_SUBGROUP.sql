--���������� ���������
create or replace procedure ADD_SUBGROUP(
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
if has_group<>0 then
select count(*) into valid from "���������" where "���_������"=group_code AND "�����_���������" = subgroup_number;
if valid=0 then
INSERT INTO "���������"("���_������","�����_���������") VALUES (group_code, subgroup_number);
else begin
  raise_application_error(-20001,'������, ����� ��������� ��� ����������');
  end;
end if;
else begin
  raise_application_error(-20001,'������, � ���� ��� ����� ������');
  end;
end if;
commit;
end ADD_SUBGROUP;
