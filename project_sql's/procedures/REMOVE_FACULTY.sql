--�������� ����������
create or replace procedure REMOVE_FACULTY(new_faculty "���������"."��������_����������"%TYPE)
is
valid integer;
begin
select count(*) into valid from "���������" where "��������_����������"=new_faculty;
if valid<>0 then
delete from "���������" where "��������_����������" = new_faculty;
else begin
  raise_application_error(-20001,'������, ������ ���������� ���');
  end;
end if;
end REMOVE_FACULTY;