--���������� ������������� �� ���������
create or replace procedure ADD_SPECIALITIS(
faculty_code "���������"."���_����������"%TYPE,
speciality_number "�������������"."�����_�������������"%TYPE,
speciality_name "�������������"."���_�������������"%TYPE)
is
valid_faculty integer;
valid integer;
begin
if (faculty_code IS NULL OR speciality_number IS NULL OR speciality_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;

select count(*) into valid_faculty from "���������" where "���_����������"=faculty_code;
if valid_faculty=0 then
raise_application_error(-20001,'���������� � ����� '||faculty_code||' �� �������');
end if;
select count(*) into valid from "�������������" 
where "���_����������" = faculty_code 
AND "���_�������������" = speciality_name 
AND "�����_�������������" = speciality_number;
if valid=0 then
INSERT INTO "�������������"("���_����������","�����_�������������","���_�������������")
VALUES (faculty_code,speciality_number,speciality_name);
else begin
  raise_application_error(-20001,'������, ����� ������ ��� ���� � ����');
  end;
end if;
commit;
end ADD_SPECIALITIS;


select * from "�������������" 
where "���_����������" = 42
AND "���_�������������" = '�����-��������' 
AND "�����_�������������" = 11103;