set serveroutput on;

execute ADD_FACULTY('���');
execute ADD_FACULTY('���');
execute ADD_FACULTY('���');

execute ADD_SPECIALITIS(42,1400201,'�������������� ������� � ���������� (�����������-��������������� ��������)');
execute ADD_SPECIALITIS(42,1400101,'����������� ����������� �������������� ����������');
execute ADD_SPECIALITIS(42,1980103,'���������� ����������� �������������� ������������ ��������� ������');
execute ADD_SPECIALITIS(42,1470102,'������ ����������� � web-�������');

execute ADD_SPECIALITIS(44,11103,'�����-��������');
execute ADD_SPECIALITIS(44,11105,'�����-�����������');
execute ADD_SPECIALITIS(43,11104,'���������');
execute ADD_SPECIALITIS(43,11114,'���������-��������');

--truncate table "�������������";
select * from "�������������";
select * from "����������";
select * from "���������";

execute ADD_DISCIPLINE(4,'��������-��������������� ����������������');
execute ADD_DISCIPLINE(4,'������ ���������� ���������� � ������ ����������');
execute ADD_DISCIPLINE(4,'������ ������ ����������(� ������� ������ ���������� ���������������� ��������������)');
execute ADD_DISCIPLINE(4,'���� ������');
execute ADD_DISCIPLINE(4,'������������ ����');
execute ADD_DISCIPLINE(4,'������ �������������� ����������');
execute ADD_DISCIPLINE(4,'������������ �������������� �������');
execute ADD_DISCIPLINE(4,'�������������� ����������������');
execute ADD_DISCIPLINE(4,'����������������� ������ ������ ����������');
execute ADD_DISCIPLINE(4,'������������ ����� ��������');
execute ADD_DISCIPLINE(4,'������ �������������� � ����������������');
execute ADD_DISCIPLINE(1,'��������� ����������������');
execute ADD_DISCIPLINE(1,'������ ���������� � ���������� �������������� ������');
execute ADD_DISCIPLINE(1,'�������� ����������');
execute ADD_DISCIPLINE(1,'���������� ������������ web-����������');
execute ADD_DISCIPLINE(1,'������ �������������� ����������');
execute ADD_DISCIPLINE(1,'��������-��������������� ����������������');
execute ADD_DISCIPLINE(1,'������������ ������������ �����������');
execute ADD_DISCIPLINE(1,'�������������� ����������������');
execute ADD_DISCIPLINE(1,'������ �������������� � ����������������');
execute ADD_DISCIPLINE(1,'������������ �������');
execute ADD_DISCIPLINE(1,'���������� IT-��������� � �������������� ����������');
execute ADD_DISCIPLINE(1,'������������ ����');
execute ADD_DISCIPLINE(1,'����������������� ��� ������ � ����������');
execute ADD_DISCIPLINE(1,'���� ������');
execute ADD_DISCIPLINE(1,'������ ������ ����������(� ������� ������ ���������� ���������������� ��������������)');
execute ADD_DISCIPLINE(1,'���������������� � ��������');
execute ADD_DISCIPLINE(1,'���������������� ������� ����������');
execute ADD_DISCIPLINE(1,'������������� � ����������� ��������� � ������');
execute ADD_DISCIPLINE(1,'������������ �������������� ������� � ������������ ����');
execute ADD_DISCIPLINE(1,'������ ���������� ���������� � ������ ����������');
execute ADD_DISCIPLINE(1,'���������������� ��������� ������');
execute ADD_DISCIPLINE(1,'���������� �������');
execute ADD_DISCIPLINE(1,'�������������� �������������� �������');
execute ADD_DISCIPLINE(1,'����������-���������� ������ �������� �������������� ����� � ����������� ����������');
execute ADD_DISCIPLINE(1,'������� � ���������� ���������������� ��������� ������');
execute ADD_DISCIPLINE(3,'�������� ����������');
execute ADD_DISCIPLINE(3,'������������ � �������������� ������������ ����������� ��������� ���������');
execute ADD_DISCIPLINE(3,'������ �������������� ����������');
execute ADD_DISCIPLINE(3,'������������ ����� ��������');
execute ADD_DISCIPLINE(3,'���� ������');
execute ADD_DISCIPLINE(3,'������������ ������������ ����������� ��������� ������');
execute ADD_DISCIPLINE(3,'���������������� �������������� � ����������� ��������� ����������');
execute ADD_DISCIPLINE(3,'���������� IT-��������� � �������������� ����������');
execute ADD_DISCIPLINE(3,'������ ���������� ���������� � ������ ����������');
execute ADD_DISCIPLINE(3,'�������������� ����������������');
execute ADD_DISCIPLINE(3,'������� ��������� �����');
execute ADD_DISCIPLINE(3,'���������������� � ��������');
execute ADD_DISCIPLINE(3,'������ �������������� � ����������������');
execute ADD_DISCIPLINE(3,'���������������� � ������������ ������� ����������');
execute ADD_DISCIPLINE(3,'���������������� ��������-��������');
execute ADD_DISCIPLINE(3,'����������-���������� ������ �������� �������������� ����� � ����������� ����������');
execute ADD_DISCIPLINE(3,'������ ������ ����������(� ������� ������ ���������� ���������������� ��������������)');
execute ADD_DISCIPLINE(3,'����������������� ������ ������ ����������');
execute ADD_DISCIPLINE(3,'���������������� � ������������ ��� ������ ��������� ������');
execute ADD_DISCIPLINE(3,'����������� ����������� ���������� ��������� ������');
execute ADD_DISCIPLINE(3,'����������� ���������� ���������������� ��������� ������');
execute ADD_DISCIPLINE(3,'�������������� ������ ������������');
execute ADD_DISCIPLINE(3,'������� ���������� ����������������� ��������� ����������');
execute ADD_DISCIPLINE(3,'�������������� ������������ ����������� ��������� ������');
execute ADD_DISCIPLINE(3,'����������� ����������� ���������� � smart ������');
execute ADD_DISCIPLINE(3,'�������������� �������������� ������ � ����������');
execute ADD_DISCIPLINE(3,'������������ ������� ��������� ���������');
execute ADD_DISCIPLINE(3,'������������ ����');
execute ADD_DISCIPLINE(2,'�������������� ��������-������');
execute ADD_DISCIPLINE(2,'���������������� � ��������');
execute ADD_DISCIPLINE(2,'��������-��������������� ���������� ���������������� � ��������� ��������������');
execute ADD_DISCIPLINE(2,'���������������� ��������-��������');
execute ADD_DISCIPLINE(2,'����������������� � ������������ ��������-������');
execute ADD_DISCIPLINE(2,'���������� ������������ �����������');
execute ADD_DISCIPLINE(2,'������������� �������������� �������');
execute ADD_DISCIPLINE(2,'���������� IT-��������� � �������������� ����������');
execute ADD_DISCIPLINE(2,'������������ ����� ��������');
execute ADD_DISCIPLINE(2,'Web-������ � ������� ��������������');
execute ADD_DISCIPLINE(2,'���������������� ��������� ����������������� ����������');
execute ADD_DISCIPLINE(2,'������ �������������� ����������');
execute ADD_DISCIPLINE(2,'���� ������');
execute ADD_DISCIPLINE(2,'����������������� ������ ������ ����������');
execute ADD_DISCIPLINE(2,'���������������� web-��������');
execute ADD_DISCIPLINE(2,'������� ���������� ���������');
execute ADD_DISCIPLINE(2,'�������������� � ������������ �������������� ������ � ����������');
execute ADD_DISCIPLINE(2,'����� ����������������');
execute ADD_DISCIPLINE(2,'���������������� � ������������ ��� ������ web-����������');
execute ADD_DISCIPLINE(2,'�������������� �������');
execute ADD_DISCIPLINE(2,'���������������� �������������� � ����������� ����������');
execute ADD_DISCIPLINE(2,'����������-���������� ������ �������� �������������� ����� � ����������� ����������');
execute ADD_DISCIPLINE(2,'������ ������ ����������(� ������� ������ ���������� ���������������� ��������������)');
execute ADD_DISCIPLINE(2,'����������� ���������� ���������������� � ��������');
execute ADD_DISCIPLINE(2,'���������������� � ������������ ������� ����������');
execute ADD_DISCIPLINE(2,'������ ���������������� ��������-����������');
execute ADD_DISCIPLINE(2,'������������ ������� � ����');
execute ADD_DISCIPLINE(2,'������ ���������� ���������� � ������ ����������');
execute ADD_DISCIPLINE(2,'������������ ������� � ��������� ����������������');
execute ADD_DISCIPLINE(2,'�������������� ����������������');
execute ADD_DISCIPLINE(2,'������ �������������� � ����������������');


execute ADD_LAB('��������� ����������������','�������������');
execute ADD_LAB('��������� ����������������','�������������');
execute ADD_LAB('��������� ����������������','COM EXE');
execute ADD_LAB('���������������� � ��������','�������');
execute ADD_LAB('���������������� � ��������','AJAX');

select * from "������������"
select * from LAB_LIST
select * from LAB_LIST WHERE "�������������" = '�������������2' AND "������������_����������"='���������������� � ��������'

select * from "����������"

execute ADD_GROUP(1400201,2013,1);
execute ADD_GROUP(1400201,2013,2);
execute ADD_GROUP(1400201,2013,1);
execute ADD_GROUP(1400201,2013,2);
execute ADD_GROUP(1400201,2013,1);
execute ADD_GROUP(1400201,2014,1);
execute ADD_GROUP(1400201,2014,2);
execute ADD_GROUP(1400201,2012,1);

execute ADD_SUBGROUP(1400201,2013,1,1);
execute ADD_SUBGROUP(1400201,2013,1,2);
execute ADD_SUBGROUP(1400201,2013,2,1);
execute ADD_SUBGROUP(1400201,2013,2,2);

execute ADD_STUDENT(1400201,2013,2,1,'�������1');
execute ADD_STUDENT(1400201,2013,1,1,'�������2');
execute ADD_STUDENT(1400201,2013,1,2,'�������3');
execute ADD_STUDENT(1400201,2013,2,2,'�������4');
execute ADD_STUDENT(1400201,2013,2,1,'�������5');
execute ADD_STUDENT(1400201,2013,1,1,'�������6');
execute ADD_STUDENT(1400201,2013,2,1,'�������7');
execute ADD_STUDENT(1400201,2013,1,1,'�����');
execute ADD_STUDENT(1400201,2013,1,1,'�����');
execute ADD_STUDENT(1400201,2013,1,1,'�����');

select * from "������������";
select * from "������������";
select * from "����������";

execute ADD_WORK(1400201,2013,1,1,'�������������2','��������� ����������������');
execute ADD_WORK(1400201,2013,1,1,'�������������2','���������������� � ��������');
execute ADD_WORK(1400201,2013,2,1,'�������������1','��������� ����������������');
execute ADD_WORK(1400201,2013,2,1,'�������������1','���������������� � ��������');

execute SET_PROGRESS(70,'�������������2',26,'�������������','�� �����');
execute SET_PROGRESS(70,'�������������2',22,'�������������','�����');
execute SET_PROGRESS(70,'�������������2',26,'�������������','�����');
execute SET_PROGRESS(53,'�������������2',22,'�������������','�����');
execute SET_PROGRESS(53,'�������������2',26,'�������������','�����');