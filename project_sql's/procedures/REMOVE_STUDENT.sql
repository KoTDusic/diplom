--�������� ���������
create or replace procedure REMOVE_STUDENT(
student_code "��������"."���_��������"%TYPE)
is
valid integer;
begin
--��������� ���� ���������
select count(*)into valid from "��������" where "���_��������" = student_code;
if valid=1 then
delete from "��������" where "���_��������" = student_code;
else begin
  raise_application_error(-20001,'������, ����� ������ ��� � ����');
  end;
end if;
commit;
end REMOVE_STUDENT;