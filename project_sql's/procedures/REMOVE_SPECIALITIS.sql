--�������� ������������� �� ���������
create or replace procedure REMOVE_SPECIALITIS(
faculty_name "���������"."��������_����������"%TYPE,
speciality_name "�������������"."���_�������������"%TYPE)
is
valid integer;
begin
select count(*) into valid from "�������������" 
where "���_����������" = (select "���_����������" from "���������" where "��������_����������"=faculty_name)
AND "���_�������������"=speciality_name;
if valid<>0 then
delete from "�������������" where 
"���_����������" = (select "���_����������" from "���������" where "��������_����������" = faculty_name)
AND "���_�������������"=speciality_name;
else begin
  raise_application_error(-20001,'������, ����� ������ ��� � ����');
  end;
end if;
end REMOVE_SPECIALITIS;