

set serveroutput on;
delete from "�������������" where "���"='������'
select * from "�������������"
select * from "������������";
delete from "������������";
select * from "����������";
select * from "�������������";
select * from "����������";

select * from "���������";
select * from "������������";
select * from "��������";
exec LOAD_LABS(22);
select * from LABS_DISCIPLINE;
select * from LABS_DISCIPLINE where "������������_����������" = '���������������� � ��������' AND "���_�������������"= '�������������� ������� � ���������� (�����������-��������������� ��������)'



select STUDENT_DISCIPLINE."���_����������","�������������","���_��������",
        "��������_������������" from STUDENT_DISCIPLINE,"������������" 
        where "������������"."���_����������"=STUDENT_DISCIPLINE."���_����������" AND "���_��������"=28;
select count(*) from "��������_�������������" 
where "���_���������" = 42 AND "���_�������������" = 23 AND "���_����������" = 123;

select * from STUDENT_LIST;

select * from STUDENT_LIST;
select * from LAB_LIST;
select * from FACULTY_LIST;
select * from KOORS_LIST where "����"=2;
select * from TEACHER_DISCIPLINE_LIST where "�������������"='�������������2';
select * from "��������_�������������"

select "���_�������������",GET_KOORS_BY_YEAR("���_�����������") as "����","�����_������","�����_���������","���"
from "��������", "���������","������","�������������"
where 
"��������"."���_���������"="���������"."���_���������" AND
"���������"."���_������"="������"."���_������" AND
"�������������"."���_�������������"="������"."���_�������������"
order by "���_�������������";

select * from "���������"
select * from "������"
select * from TEACHER_DISCIPLINE_LIST "3fa7114d-5fb9-4f64-be58-a77c16e1dbf1"

select * from "�������������";
execute ADD_TEACHER('�������������1');
execute ADD_TEACHER('�������������2');
execute ADD_TEACHER('�������������3');
execute ADD_TEACHER('����');
execute REMOVE_TEACHER('asdasd-12-asf');
execute ADD_TEACHER('������� ���� ��������');

select * from "���������";
execute ADD_FACULTY('���');
exec ADD_FACULTY('���');
exec ADD_FACULTY('���');

execute REMOVE_FACULTY('���');


select * from "�������������";
execute ADD_SPECIALITIS('���','1-1101','����');
execute ADD_SPECIALITIS('���','1-1102','������');
exec ADD_SPECIALITIS('���','1-1103','�����-��������');
exec ADD_SPECIALITIS('���','1-1105','�����-�����������');
exec ADD_SPECIALITIS('���','1-1104','���������');
exec ADD_SPECIALITIS('���','1-1104','���������-��������');
exec ADD_SPECIALITIS('���','1111_123','��� ��');
execute REMOVE_SPECIALITIS('���','����');
execute REMOVE_SPECIALITIS('���','������');
delete from "�������������" where "���_�������������"='1111_123'

delete from "����������" where "���_����������"=144;
execute ADD_DISCIPLINE('1-1101','��������� ����������������');
execute ADD_DISCIPLINE('1-1101','���������������� � Internet');
execute ADD_DISCIPLINE('1-1102','������������');
execute REMOVE_DISCIPLINE('1-1101','���������������� � Internet');
execute REMOVE_DISCIPLINE('007','����a��� ����� � ��� �����');
select * from "������������";
execute ADD_LAB('��������� ����������������','�������������');
execute ADD_LAB('��������� ����������������','�������������');
execute ADD_LAB('��������� ����������������','COM EXE');
execute ADD_LAB('���������������� � Internet','�������');
execute ADD_LAB('���������������� � Internet','AJAX');
execute ADD_LAB('������������','ShemBuilder');
execute REMOVE_LAB('���������������� � Internet','�������');
execute REMOVE_LAB('��������� ����������������','�������������');

execute REMOVE_LAB('���������������� � Internet','1111');

select * from "������";
execute ADD_GROUP('1-1101',2013,1);
execute ADD_GROUP('1-1101',2013,2);
execute ADD_GROUP('1-1102',2013,1);
execute ADD_GROUP('1-1102',2013,2);
execute ADD_GROUP('1-1105',2013,1);

exec ADD_GROUP('1-1103',2014,1);
exec ADD_GROUP('1-1103',2014,2);
exec ADD_GROUP('1-1104',2012,1);
execute ADD_SUBGROUP('1-1102',2013,7,1);
execute ADD_SUBGROUP('1-1105',2013,1,1);
select * from "���������";
execute ADD_SUBGROUP('1-1101',2013,1,1);
execute ADD_SUBGROUP('1-1101',2013,1,2);
execute ADD_SUBGROUP('1-1101',2013,2,1);
execute ADD_SUBGROUP('1-1101',2013,2,2);
execute ADD_SUBGROUP('1-1102',2013,1,1);
execute ADD_SUBGROUP('1-1102',2013,2,1);
execute REMOVE_SUBGROUP('1-1101',2013,1,1);
execute REMOVE_SUBGROUP('1-1101',2013,1,2);
execute REMOVE_SUBGROUP('1-1101',2013,2,1);
execute REMOVE_SUBGROUP('1-1101',2013,2,2);

select * from "��������";
execute ADD_STUDENT('1-1101',2013,2,1,'�������1');
execute ADD_STUDENT('1-1101',2013,1,1,'�������2');
execute ADD_STUDENT('1-1101',2013,1,2,'�������3');
execute ADD_STUDENT('1-1101',2013,2,2,'�������4');
execute ADD_STUDENT('1-1101',2013,2,1,'�������5');
execute ADD_STUDENT('1-1101',2013,1,1,'�������6');
execute ADD_STUDENT('1-1102',2013,2,1,'�������7');
execute ADD_STUDENT('1-1105',2013,1,1,'�����');
execute ADD_STUDENT('1-1105',2013,1,1,'�����');
execute ADD_STUDENT('1-1105',2013,1,1,'�����');
execute REMOVE_STUDENT('1',3012,2,1,'asfa');

select * from "�������������";
select * from "����������" order by "������������_����������";
select * from "���������";
select * from "������";
select * from "�������������";
select * from "��������_�������������";
select * from TEACHER_DISCIPLINE
execute REMOVE_WORK(21,'������','���� ������');
execute REMOVE_WORK(22,'������','���� ������');

execute ADD_WORK(21,'������','��������� ����������������');
execute ADD_WORK(21,'������','���������������� � ��������');
execute ADD_WORK(22,'������','���������������� � ��������');
execute ADD_WORK(21,'������','���� ������');
execute ADD_WORK(22,'������','���� ������');
execute ADD_WORK(21,'������','�������������� �������������� �������');
execute ADD_WORK(22,'������','�������������� �������������� �������');

select * from "����������"
select * from "��������";

execute SET_PROGRESS(1,'�������������2',6,'�������������','�� �����');
execute SET_PROGRESS(1,'�������������2',6,'�������������','�����');
execute SET_PROGRESS(1,'�������������2',2,'�������������','�����');
execute SET_PROGRESS(3,'�������������3',7,'ShemBuilder','�����');
execute ADD_LAB('���������� ��������','��������� ��������');
execute SET_PROGRESS(1,'�������������2',2,'�������������','�����');
delete from "������������" where "��������_������������"='<>'
select * from "������������";
select * from "������������";
select * from "��������";
select * from STUDENT_LIST;
select * from LAB_LIST;
select * from FACULTY_LIST;
select * from KOORS_LIST where "����"=2;
select * from TEACHER_DISCIPLINE_LIST where "�������������"='�������������3';

select * from "��������" Where "���"='wtrwteww'

select * from "����������";
select * from "��������";
select * from  "��������_�������������"
select count(*) from "��������_�������������"
where "���_���������" = 16 AND "���_�������������" = 43
AND "���_����������" = 2;
select * from "������������";
select * from TEACHER_DISCIPLINE_LIST;
select * from LAB_LIST;

select "���_������",
       "���_�������������",
       "���_�����������",
       "�����_������"
  from "������","�������������" where "������"."���_�������������"="�������������"."���_�������������"

select "������������"."��������_������������" as "��������_������������" 
 from "����������" "����������",
    "������������" "������������" 
 where "������������"."���_����������"="����������"."���_����������" AND "����������"."������������_����������"='��������� ����������������'