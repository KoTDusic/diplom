--�������������� ����������
create or replace procedure EDIT_FACULTY(
identifer "���������"."���_����������"%TYPE,
new_name "���������"."��������_����������"%TYPE)
is
valid integer;
begin
if (new_name IS NULL or identifer is null) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "���������" where "���_����������"=identifer;
if valid<>0 then
update "���������" set "��������_����������"=new_name where "���_����������"=identifer;
else begin
  raise_application_error(-20001,'������, ��������� c id'||identifer||' �� ������ � ��');
  end;
end if;
commit;
end EDIT_FACULTY;