--�������� ���������� � �������������
create or replace procedure REMOVE_LAB(
speciality_name "�������������"."���_�������������"%TYPE,
discipline_name "����������"."������������_����������"%TYPE,
lab_name "������������"."��������_������������"%TYPE)
is 
valid integer;
kod integer;
begin
select "���_����������" into kod from "�������������","����������" 
where "�������������"."���_�������������"="����������"."���_�������������"
AND "����������"."������������_����������"=discipline_name
AND "�������������"."���_�������������"=speciality_name;
select count(*) into valid from "������������" where
"���_����������"=kod AND "��������_������������"=lab_name;
if valid<>0 then
delete from "������������" where "��������_������������" = lab_name
AND "���_����������"=kod;
else begin
  raise_application_error(-20001,'������, ����� ������������ ��� � ����');
  end;
end if;
commit;
end REMOVE_LAB;