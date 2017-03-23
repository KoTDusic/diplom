--���������� ����������
create or replace procedure ADD_FACULTY(new_faculty "���������"."��������_����������"%TYPE)
is
valid integer;
begin
if (new_faculty IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "���������" where "��������_����������"=new_faculty;
if valid=0 then
  INSERT INTO "���������"("��������_����������") VALUES (new_faculty);
else begin
  raise_application_error(-20001,'������, ����� ��������� ��� ����������');
  end;
end if;
commit;
end ADD_FACULTY;