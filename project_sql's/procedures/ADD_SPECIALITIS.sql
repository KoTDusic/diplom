--���������� ������������� �� ���������
create or replace procedure ADD_SPECIALITIS(
faculty_name "���������"."��������_����������"%TYPE,
speciality_code "�������������"."���_�������������"%TYPE,
speciality_name "�������������"."���_�������������"%TYPE)
is
valid integer;
begin
if (faculty_name IS NULL OR speciality_code IS NULL OR speciality_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "�������������" 
where "���_����������" = (select "���_����������" from "���������" where "��������_����������"=faculty_name) AND
"���_�������������" = speciality_code AND "���_�������������"=speciality_name;
if valid=0 then
INSERT INTO "�������������"("���_����������","���_�������������","���_�������������")
VALUES ((select "���_����������" from "���������" where "��������_����������"=faculty_name),speciality_code,speciality_name);
else begin
  raise_application_error(-20001,'������, ����� ������ ��� ���� � ����');
  end;
end if;
commit;
end ADD_SPECIALITIS;