--���������� ����� �������������-���������-����������
create or replace procedure ADD_WORK(
subgroup_kode "���������"."���_���������"%TYPE,
teacher_kode "�������������"."���_�������������"%TYPE,
discipline_code "����������"."���_����������"%TYPE)
is 
valid integer;
valid_discipline integer;
valid_subgroup_discipline integer;
begin
if (subgroup_kode IS NULL OR teacher_kode IS NULL OR discipline_code IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;

--�������� ������� ���������� � ����� �����
select count(*) into valid_discipline from "����������" where "���_����������"=discipline_code;
if valid_discipline=0
    then
    raise_application_error(-20001,'�� ������� ���������� � ����� '||discipline_code);
    end if;
--�������� ������� ������ � �������� �������������
select count(*)into valid from "��������_�������������" 
where "���_���������" = subgroup_kode AND "���_����������" = discipline_code;
if valid=1
    then
    raise_application_error(-20001,'������, � ��������� � ����� '||subgroup_kode||' ��� �������� �������������');
    end if;
--�������� �������������� ���������� ������������� ��������� 
select count(*) into valid_subgroup_discipline from "���������"
left join "������" on "���������"."���_������"="������"."���_������" 
left join "����������" on "����������"."���_�������������" = "������"."���_�������������" 
where "���_���������"=subgroup_kode AND "���_����������" = discipline_code;
if valid_subgroup_discipline=0 then
    raise_application_error(-20001,'������, � ���� ��������� ��� �������� ����������');
end if;
INSERT INTO "��������_�������������"("���_���������","���_�������������","���_����������") 
values(subgroup_kode,teacher_kode,discipline_code);
commit;
end ADD_WORK;


