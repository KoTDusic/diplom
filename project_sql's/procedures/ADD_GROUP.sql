--���������� ������
create or replace procedure ADD_GROUP(
speciality_code "������"."���_�������������"%TYPE,
age "������"."���_�����������"%TYPE,
group_number "������"."�����_������"%TYPE)
is
valid integer;
begin
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "������" 
where "������"."���_�������������"=speciality_code AND
"������"."���_�����������" = age AND
"������"."�����_������" = group_number;
if valid=0 then

INSERT INTO "������"("���_�������������","���_�����������","�����_������")
VALUES (speciality_code, age, group_number);

else begin
  raise_application_error(-20001,'������, ����� ������ ��� ����');
  end;
end if;
commit;
end ADD_GROUP;