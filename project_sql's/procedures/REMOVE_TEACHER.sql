--�������� ��������������
create or replace procedure REMOVE_TEACHER(fio "�������������"."���"%TYPE)
is
valid integer;
begin
select count(*) into valid from "�������������" where "���"=fio;
if valid<>0 then
delete from "�������������" where "���" = fio;
else begin
  raise_application_error(-20001,'������, ������ ������������� ��� � ����');
  end;
end if;
end REMOVE_TEACHER;