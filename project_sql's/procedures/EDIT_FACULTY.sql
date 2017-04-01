--�������������� ����������
create or replace procedure EDIT_FACULTY(
old_name "���������"."��������_����������"%TYPE,
new_name "���������"."��������_����������"%TYPE)
is
valid integer;
begin
if (new_name IS NULL or old_name is null) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "���������" where "��������_����������"=old_name;
if valid<>0 then
update "���������" set "��������_����������"=new_name where "��������_����������"=old_name;
else begin
  raise_application_error(-20001,'������, ��������� '||old_name||' �� ������ � ��');
  end;
end if;
commit;
end EDIT_FACULTY;