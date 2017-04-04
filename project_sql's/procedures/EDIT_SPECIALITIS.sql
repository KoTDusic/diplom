--�������������� �������������
create or replace procedure EDIT_SPECIALITIS(
faculty_code "���������"."���_����������"%TYPE,
speciality_code "�������������"."���_�������������"%TYPE,
new_speciality_number "�������������"."�����_�������������"%TYPE,
new_speciality_name "�������������"."���_�������������"%TYPE)
is
valid_faculty integer;
valid integer;
begin
if (faculty_code IS NULL OR speciality_code IS NULL OR new_speciality_number IS NULL OR new_speciality_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid_faculty from "���������" where "���_����������"=faculty_code;
if valid_faculty=0 then
raise_application_error(-20001,'���������� � ����� '||faculty_code||' �� �������');
end if;
select count(*) into valid from "�������������" 
where "���_����������" = faculty_code AND
"���_�������������" = speciality_code;
if valid<>0 then
update "�������������" set "���_�������������"=new_speciality_name, "�����_�������������"=new_speciality_number
where "���_�������������" = speciality_code;
else begin
  raise_application_error(-20001,'������, ������������� � ����� '||speciality_code||' �� �������');
  end;
end if;
commit;
end EDIT_SPECIALITIS;