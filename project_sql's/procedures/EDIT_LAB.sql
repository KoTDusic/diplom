--�������������� ������������
create or replace procedure EDIT_LAB(
lab_code "������������"."���_������������"%TYPE,
new_lab_name "������������"."��������_������������"%TYPE)
is 
valid integer;
begin
if (new_lab_name IS NULL OR lab_code IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "������������" where "���_������������"=lab_code;
if valid=1 then
update "������������" set "��������_������������"=new_lab_name where "���_������������"=lab_code;
else begin
  raise_application_error(-20001,'������, ������������ �� ����� '||lab_code||' ��� � ����');
  end;
end if;
commit;
end EDIT_LAB;
