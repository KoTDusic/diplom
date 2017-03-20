--����������/�������� ������ ������������
create or replace procedure SET_PROGRESS(
speciality_code "������"."���_�������������"%TYPE,
discipline_name "����������"."������������_����������"%TYPE,
teacher_name "�������������"."���"%TYPE,
student_name "��������"."���"%TYPE,
lab_name "������������"."��������_������������"%TYPE,
status "������������"."������_�����"%TYPE)
is
discipline_code number;
lab_code number;
teacher_kode number;
student_kode number;
subgroup_kode number;
hasStr number;
Valid number;
begin
if (speciality_code IS NULL OR discipline_name IS NULL OR teacher_name IS NULL OR student_name IS NULL OR lab_name IS NULL OR status IS NULL) then
raise_application_error(-20001,'�������� ��������: speciality_code='||speciality_code||'discipline_name='||discipline_name||
'teacher_name='||teacher_name||
'student_name='||student_name||'lab_name='||lab_name||'status='||status);
end if;
--����� ���� ����������
select "���_����������" into discipline_code from "����������" 
where "���_�������������" = speciality_code AND "������������_����������" = discipline_name;
--����� ���� ������������
select "�����_������������" into lab_code from "������������" 
where "���_����������" = discipline_code AND "��������_������������"=lab_name;
--����� ���� ��������
select "���_��������" into student_kode from "��������"
where "���" = student_name;
--��������� ��������
select "���_���������" into subgroup_kode from "��������"
where "���" = student_name;
--����� ���� �������������
select "���_�������������" into teacher_kode from "�������������"
where "���" = teacher_name;
--��������, ����� �������� ����� ������, ��� �������� ������������
select count(*) into hasStr from "������������" 
where "���_����������"=discipline_code AND "���_�������������"=teacher_kode
AND "�����_������������"=lab_code AND "���_��������"=student_kode;
--��������, �������� �� ������������� ��� ���������� � ���� ���������
select count(*) into Valid from "��������_�������������"
where "���_���������" = subgroup_kode AND "���_�������������" = teacher_kode 
AND "���_����������" = discipline_code;
if Valid<>0 then
  if hasStr=0 then
  insert into "������������" values(discipline_code,teacher_kode,lab_code,student_kode,status);
  else update "������������" set "������_�����" = status
  where "���_����������"=discipline_code AND "���_�������������"=teacher_kode
  AND "�����_������������"=lab_code AND "���_��������"=student_kode;
  end if;
  else begin
  raise_application_error(-20001,'������, ���� ������������� �� �������� ��� ���������� � ���� ���������');
  end;
end if;
end SET_PROGRESS;
