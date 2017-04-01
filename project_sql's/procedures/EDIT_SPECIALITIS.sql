--�������������� �������������
create or replace procedure EDIT_SPECIALITIS(
faculty_name "���������"."��������_����������"%TYPE,
speciality_code "�������������"."���_�������������"%TYPE,
new_speciality_name "�������������"."���_�������������"%TYPE)
is
valid integer;
faculty_code "���������"."���_����������"%TYPE;
begin
if (faculty_name IS NULL OR speciality_code IS NULL OR new_speciality_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select "���_����������" into faculty_code from "���������" where "��������_����������"=faculty_name;
select count(*) into valid from "�������������" 
where "���_����������" = faculty_code AND
"���_�������������" = speciality_code;
if valid<>0 then
update "�������������" set "���_�������������"=new_speciality_name where "���_�������������" = speciality_code;
else begin
  raise_application_error(-20001,'������, ������������� � ����� '||speciality_code||' �� �������');
  end;
end if;
commit;
end EDIT_SPECIALITIS;