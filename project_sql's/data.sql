set serveroutput on;

execute ADD_TEACHER('�������������1','asdasd-12-asf');
execute ADD_TEACHER('�������������2','ertedr-123-fgf');
execute ADD_TEACHER('�������������3','ghkjrtre-54732-rtyrtr');


execute ADD_FACULTY('���');
execute ADD_FACULTY('���');
execute ADD_FACULTY('���');

execute ADD_SPECIALITIS('���','1-1101','����');
execute ADD_SPECIALITIS('���','1-1102','������');
execute ADD_SPECIALITIS('���','1-1103','�����-��������');
execute ADD_SPECIALITIS('���','1-1105','�����-�����������');
execute ADD_SPECIALITIS('���','1-1104','���������');
execute ADD_SPECIALITIS('���','1-1114','���������-��������');
execute ADD_SPECIALITIS('���','1111_123','��� ��');

execute ADD_DISCIPLINE('1-1101','��������� ����������������');
execute ADD_DISCIPLINE('1-1101','���������������� � Internet');
execute ADD_DISCIPLINE('1-1102','������������');

execute ADD_LAB('��������� ����������������','�������������');
execute ADD_LAB('��������� ����������������','�������������');
execute ADD_LAB('��������� ����������������','COM EXE');
execute ADD_LAB('���������������� � Internet','�������');
execute ADD_LAB('���������������� � Internet','AJAX');
execute ADD_LAB('������������','ShemBuilder');

execute ADD_GROUP('1-1101',2013,1);
execute ADD_GROUP('1-1101',2013,2);
execute ADD_GROUP('1-1102',2013,1);
execute ADD_GROUP('1-1102',2013,2);
execute ADD_GROUP('1-1105',2013,1);
execute ADD_GROUP('1-1103',2014,1);
execute ADD_GROUP('1-1103',2014,2);
execute ADD_GROUP('1-1104',2012,1);

execute ADD_SUBGROUP('1-1105',2013,1,1);
execute ADD_SUBGROUP('1-1101',2013,1,1);
execute ADD_SUBGROUP('1-1101',2013,1,2);
execute ADD_SUBGROUP('1-1101',2013,2,1);
execute ADD_SUBGROUP('1-1101',2013,2,2);
execute ADD_SUBGROUP('1-1102',2013,1,1);
execute ADD_SUBGROUP('1-1102',2013,2,1);

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

execute ADD_WORK('1-1101',2013,1,1,'�������������2','��������� ����������������');
execute ADD_WORK('1-1101',2013,1,1,'�������������2','���������������� � Internet');
execute ADD_WORK('1-1101',2013,2,1,'�������������1','��������� ����������������');
execute ADD_WORK('1-1101',2013,2,1,'�������������1','���������������� � Internet');
execute ADD_WORK('1-1102',2013,2,1,'�������������3','������������');

execute SET_PROGRESS(1,'�������������2',6,'�������������','�� �����');
execute SET_PROGRESS(1,'�������������2',6,'�������������','�����');
execute SET_PROGRESS(1,'�������������2',2,'�������������','�����');
execute SET_PROGRESS(3,'�������������3',7,'ShemBuilder','�����');
execute SET_PROGRESS(1,'�������������2',2,'�������������','�����');