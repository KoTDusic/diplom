--�������� ����� �������������-���������-����������
create or replace procedure REMOVE_WORK(
kode "��������_�������������"."���_��������"%TYPE)
is 
valid integer;
begin
if (kode IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
--�������� ������� ������
select count(*)into valid from "��������_�������������" where "���_��������" = kode;
if valid=1 then
delete "��������_�������������" where "���_��������"=kode;
else begin
    raise_application_error(-20001,'������, ������ c ����� '||kode||' ��� � ����');
  end;
end if;
commit;
end REMOVE_WORK;