--�������� �����
create or replace procedure REMOVE_GROUP(
speciality_code "������"."���_�������������"%TYPE,
age "������"."���_�����������"%TYPE,
group_number "������"."�����_������"%TYPE)
is
valid integer;
begin
select count(*) into valid from "������" 
where "������"."���_�������������"=speciality_code AND
"������"."���_�����������" = age AND
"������"."�����_������" = group_number;
if valid<>0 then
delete from "������" where "���_�������������" = speciality_code
AND "���_�����������" = age
AND "�����_������" = group_number;
else begin
  raise_application_error(-20001,'������, ����� ������ ��� � ����');
  end;
end if;
end REMOVE_GROUP;