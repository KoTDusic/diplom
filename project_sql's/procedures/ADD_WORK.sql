--���������� ����� �������������-���������-����������
create or replace procedure ADD_WORK(
subgroup_kode "���������"."���_���������"%TYPE,
teacher_name "�������������"."���"%TYPE,
discipline_name "����������"."������������_����������"%TYPE)
is 
valid integer;
kod integer;
valid_discipline integer;
teacher_kode nvarchar2(50);
begin
if (subgroup_kode IS NULL OR teacher_name IS NULL OR discipline_name IS NULL) then
raise_application_error(-20001,'�������� ��������');
end if;
--��������� ���� �������������
select "���_�������������" into teacher_kode from "�������������" where "���" = teacher_name;

--�������� �������������� ���������� ������������� ���������
select count(*) into valid_discipline from "���������","������","����������" where "���������"."���_������" = "������"."���_������"
AND "����������"."���_�������������"="������"."���_�������������" AND "���_���������"=subgroup_kode AND "������������_����������"=discipline_name;
--�������� ���� ����������
select "���_����������" into kod from "���������","������","����������" where "���������"."���_������" = "������"."���_������"
AND "����������"."���_�������������"="������"."���_�������������" AND "���_���������"=subgroup_kode AND "������������_����������"=discipline_name;
--�������� ������� ������
select count(*)into valid from "��������_�������������" 
where "���_���������" = subgroup_kode AND "���_�������������" = teacher_kode AND "���_����������" = kod;
if valid=0
    then
        if valid_discipline<>0
            then
                INSERT INTO "��������_�������������"("���_���������","���_�������������","���_����������") 
                values(subgroup_kode,teacher_kode,kod);
            else begin
                raise_application_error(-20001,'������, � ���� ��������� ��� �������� ����������');
            end;
        end if;
    else begin
      raise_application_error(-20001,'������, ����� ������ ��� ����');
    end;
end if;
commit;
end ADD_WORK;