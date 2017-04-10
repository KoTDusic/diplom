--���������� ����������  �� �������������
create or replace procedure ADD_LAB(
discipline_id "����������"."���_����������"%TYPE,
lab_name "������������"."��������_������������"%TYPE)
is 
valid integer;
kod integer;
subgroup_kod integer;
CURSOR get_subgroups IS select "���_���������" from "��������_�������������" where "���_����������"=discipline_id;
begin
if (discipline_id IS NULL OR lab_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
select count(*) into valid from "������������" where "���_����������"=discipline_id AND "��������_������������"=lab_name;
if valid=0 then
DBMS_OUTPUT.PUT_LINE(discipline_id||'  '||lab_name);
INSERT INTO "������������"("���_����������","��������_������������")
VALUES (discipline_id, lab_name);
OPEN get_subgroups;
    FETCH get_subgroups INTO subgroup_kod;
    WHILE get_subgroups%FOUND LOOP 
        LOAD_LABS_SUBGROUP(subgroup_kod);
        FETCH get_subgroups INTO subgroup_kod;
    END LOOP; 
CLOSE get_subgroups;
else begin
  raise_application_error(-20001,'������, ����� ������������ ��� ���� � ����');
  end;
end if;
commit;
end ADD_LAB;