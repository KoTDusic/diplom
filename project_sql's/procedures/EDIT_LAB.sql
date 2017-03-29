--�������������� ������������
create or replace procedure EDIT_LAB(
discipline_name "����������"."������������_����������"%TYPE,
lab_name "������������"."��������_������������"%TYPE,
new_lab_name "������������"."��������_������������"%TYPE)
is 
valid integer;
kod integer;
begin
if (discipline_name IS NULL OR lab_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select "���_����������" into kod from "����������" where "������������_����������"=discipline_name;
select count(*) into valid from "������������" where "���_����������"=kod AND "��������_������������"=lab_name;
if valid=1 then
DBMS_OUTPUT.PUT_LINE(kod||'  '||lab_name);
update "������������" set "��������_������������"=new_lab_name 
where "��������_������������"=lab_name AND "���_����������"=kod;
else begin
  raise_application_error(-20001,'������, ������������ '||lab_name||' ��� � ����');
  end;
end if;
commit;
end EDIT_LAB;