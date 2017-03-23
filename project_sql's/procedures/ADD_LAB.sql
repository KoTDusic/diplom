--���������� ����������  �� �������������
create or replace procedure ADD_LAB(
discipline_name "����������"."������������_����������"%TYPE,
lab_name "������������"."��������_������������"%TYPE)
is 
valid integer;
kod integer;
begin
if (discipline_name IS NULL OR lab_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select "���_����������" into kod from "����������" where "������������_����������"=discipline_name;
select count(*) into valid from "������������" where "���_����������"=kod AND "��������_������������"=lab_name;
if valid=0 then
DBMS_OUTPUT.PUT_LINE(kod||'  '||lab_name);
INSERT INTO "������������"("���_����������","��������_������������")
VALUES (kod, lab_name);
else begin
  raise_application_error(-20001,'������, ����� ������������ ��� ���� � ����');
  end;
end if;
commit;
end ADD_LAB;