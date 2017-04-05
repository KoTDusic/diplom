--���������� ����������  �� �������������
create or replace procedure ADD_DISCIPLINE(
speciality_code "�������������"."���_�������������"%TYPE,
discipline_name "����������"."������������_����������"%TYPE)
is 
valid_speciality integer;
valid integer;
begin
if (speciality_code IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid_speciality from "�������������" where "���_�������������"=speciality_code;
if valid_speciality=0 then
raise_application_error(-20001,'������������� � ����� '||speciality_code||' �� �������');
end if;
select count(*) into valid from "����������" where
"���_�������������"=speciality_code AND "������������_����������"=discipline_name;
if valid=0 then
INSERT INTO "����������"("���_�������������","������������_����������")
VALUES (speciality_code, discipline_name);
else begin
  raise_application_error(-20001,'������, ����� ������ ��� ����');
  end;
end if;
commit;
end ADD_DISCIPLINE;