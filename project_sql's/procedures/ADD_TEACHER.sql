--���������� ��������������
create or replace procedure ADD_TEACHER(fio "�������������"."���"%TYPE, identificator "�������������"."���_�������������"%TYPE)
is
valid integer;
begin
if (fio IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "�������������" where "���"=fio OR "���_�������������"=identificator;
if valid=0 then
INSERT INTO "�������������"("���_�������������","���") VALUES (identificator, fio);
else begin
  raise_application_error(-20001,'������, ����� ������������� ��� ���� � ����');
  end;
end if;
commit;
end ADD_TEACHER;