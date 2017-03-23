--���������� ����������  �� �������������
create or replace procedure ADD_DISCIPLINE(
speciality_code "����������"."���_�������������"%TYPE,
discipline_name "����������"."������������_����������"%TYPE)
is 
valid integer;
begin
if (speciality_code IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "����������" where
"���_�������������"=LTRIM(RTRIM(speciality_code)) AND "������������_����������"=LTRIM(RTRIM(discipline_name));
if valid=0 then
INSERT INTO "����������"("���_�������������","������������_����������")
VALUES (LTRIM(RTRIM(speciality_code)), LTRIM(RTRIM(discipline_name)));
else begin
  raise_application_error(-20001,'������, ����� ������ ��� ����');
  end;
end if;
commit;
end ADD_DISCIPLINE;