create or replace view LAB_LIST as
select "���_������","��������"."���_��������","������"."���_�������������","����������"."���_����������","����������"."������������_����������","�������������"."���" as "�������������",
"��������"."���" as "�������",GET_KOORS_BY_YEAR("���_�����������") as "����","���������"."���_���������","���������"."�����_���������","�������������"."���_�������������",
"������"."�����_������","������������"."���_������������","��������_������������","������_�����"
from "������������","����������", "������������", "�������������","��������","���������","������" 
where "������������"."���_����������"="����������"."���_����������"
AND "������������"."���_������������"="������������"."���_������������"
AND "������������"."���_�������������"="�������������"."���_�������������" 
AND "��������"."���_��������"="������������"."���_��������"
AND "��������"."���_���������"="���������"."���_���������"
AND "���������"."���_������" = "������"."���_������";