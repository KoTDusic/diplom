--���������� ��������������
create or replace procedure ADD_TEACHER(fio "�������������"."���"%TYPE)
is
valid integer;
begin
if (fio IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "�������������" where "���"=fio;
if valid=0 then
INSERT INTO "�������������"("���") VALUES (fio);
else begin
  raise_application_error(-20001,'������, ����� ������������� ��� ���� � ����');
  end;
end if;
end ADD_TEACHER;