--�������� ��������������
create or replace procedure EDIT_TEACHER(
new_fio "�������������"."���"%TYPE,
identificator "�������������"."���_�������������"%TYPE)
is
valid integer;
begin
if (new_fio IS NULL or identificator is null) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "�������������" where "���_�������������"=identificator;
if valid=1 then
update "�������������" set "���"=new_fio where "���_�������������" = identificator;
else begin
  raise_application_error(-20001,'������, ������ ������������� ��� � ����');
  end;
end if;
commit;
end EDIT_TEACHER;