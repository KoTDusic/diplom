--�������� ��������������
create or replace procedure REMOVE_TEACHER(identificator "�������������"."���_�������������"%TYPE)
is
valid integer;
begin
select count(*) into valid from "�������������" where "���_�������������"=identificator;
if valid<>0 then
delete from "�������������" where "���_�������������" = identificator;
else begin
  raise_application_error(-20001,'������, ������ ������������� ��� � ����');
  end;
end if;
commit;
end REMOVE_TEACHER;