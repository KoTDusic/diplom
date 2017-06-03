--�������� ������������� �� ����������
create or replace procedure REMOVE_SPECIALITIS(
speciality_code "�������������"."���_�������������"%TYPE)
is
valid_speciality integer;
valid integer;
begin
if (speciality_code IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid_speciality from "�������������" where "���_�������������"=speciality_code;
if valid_speciality=0 then
raise_application_error(-20001,'������������� � ����� '||speciality_code||' �� �������');
end if;
select count(*) into valid from "�������������" where "���_�������������" = speciality_code;
if valid<>0 then
delete from "�������������" where "���_�������������" = speciality_code;
else begin
  raise_application_error(-20001,'������, ����� ������ ��� � ����');
  end;
end if;
commit;
end REMOVE_SPECIALITIS;