--�������� ����������
create or replace procedure REMOVE_FACULTY(
identifer "���������"."���_����������"%TYPE)
is
valid integer;
begin
select count(*) into valid from "���������" where "���_����������"=identifer;
if valid<>0 then
delete from "���������" where "���_����������" = identifer;
else begin
  raise_application_error(-20001,'������, ���������� � id'||identifer||' ���');
  end;
end if;
commit;
end REMOVE_FACULTY;