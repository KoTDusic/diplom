--�������� ���������� � �������������
create or replace procedure REMOVE_LAB(
discipline_name "����������"."������������_����������"%TYPE,
lab_name "������������"."��������_������������"%TYPE)
is 
valid integer;
begin
select count(*) into valid from "������������" where
"���_����������"=(select "���_����������" from "����������" where "������������_����������"=discipline_name) AND "��������_������������"=lab_name;
if valid<>0 then
delete from "������������" where "��������_������������" = lab_name
AND "���_����������"=(select "���_����������" from "����������" where "������������_����������" = discipline_name);
else begin
  raise_application_error(-20001,'������, ����� ������������ ��� � ����');
  end;
end if;
end REMOVE_LAB;