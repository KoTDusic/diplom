--�������� �����
create or replace procedure REMOVE_GROUP(
group_code "������"."���_������"%TYPE)
is
valid integer;
begin
select count(*) into valid from "������" where "������"."���_������"=group_code;
if valid<>0 then
delete from "������" where "���_������" = group_code;
else begin
  raise_application_error(-20001,'������, ����� ������ ��� � ����');
  end;
end if;
commit;
end REMOVE_GROUP;