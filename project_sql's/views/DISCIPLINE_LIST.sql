create or replace view DISCIPLINE_LIST as
select "���������"."���_����������","�������������"."���_�������������","���_����������",
"��������_����������", "�����_�������������", "���_�������������", "������������_����������"
from "���������"
right join "�������������" on "���������"."���_����������"="�������������"."���_����������"
right join "����������" on "�������������"."���_�������������"="����������"."���_�������������"