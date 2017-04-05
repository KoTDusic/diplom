--��������� ����������  �� �������������
create or replace procedure EDIT_DISCIPLINE(
speciality_code "����������"."���_�������������"%TYPE,
new_discipline_name "����������"."������������_����������"%TYPE
)
is 
valid integer;
valid_newvalue integer;
begin
if (speciality_code IS NULL OR new_discipline_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "�������������" where "���_�������������"=speciality_code;
select count(*) into valid_newvalue from "����������" where "���_�������������"=speciality_code AND "������������_����������"=new_discipline_name;

if (valid_newvalue<>0) then
raise_application_error(-20001,'���������� �������������, ����� ���������� ��� ����');
end if;
if valid=1 then
update "����������" set "������������_����������"=new_discipline_name where "���_�������������"=speciality_code;
else begin
  raise_application_error(-20001,'������, ������������� � ����� '||speciality_code||' ��� � ����');
  end;
end if;
commit;
end EDIT_DISCIPLINE;