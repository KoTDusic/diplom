--�������� ���������� � �������������
create or replace procedure REMOVE_DISCIPLINE(
speciality_code "����������"."���_�������������"%TYPE,
speciality_name "����������"."������������_����������"%TYPE)
is
valid integer;
begin
select count(*) into valid from "����������" where
"���_�������������" = speciality_code AND "������������_����������" = speciality_name;
if valid<>0 then
delete from "����������" where speciality_code = "���_�������������"
AND speciality_name = "������������_����������";
else begin
  raise_application_error(-20001,'������, ����� ������ �� ����������');
  end;
end if;
commit;
end REMOVE_DISCIPLINE;