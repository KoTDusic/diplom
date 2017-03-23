--���������� ��������
create or replace procedure ADD_SUBGROUP(
speciality_code "������"."���_�������������"%TYPE,
age "������"."���_�����������"%TYPE,
group_number "������"."�����_������"%TYPE,
subgroup_number "���������"."�����_���������"%TYPE)
is
group_code number;
valid integer;
begin
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL OR subgroup_number IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select "���_������" into group_code from "������" where "���_�������������" = speciality_code AND "���_�����������" = age AND "�����_������" = group_number;
if group_code<>0 then
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
