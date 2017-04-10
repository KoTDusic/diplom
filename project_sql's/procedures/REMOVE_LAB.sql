--�������� ���������� � �������������
create or replace procedure REMOVE_LAB(
lab_code "������������"."���_������������"%TYPE)
is 
valid integer;
begin
if (lab_code IS NULL) then
raise_application_error(-20001,'�������� �������� ������� ����������');
end if;
select count(*) into valid from "������������" where "���_������������"=lab_code;
if valid<>0 then
delete from "������������" where "���_������������" = lab_code;
else begin
  raise_application_error(-20001,'������, ����� ������������ ��� � ����');
  end;
end if;
commit;
end REMOVE_LAB;