CREATE or replace trigger "BI_��������_�������������"
  before insert on "��������_�������������"
  for each row
begin
  select "��������_�������������_SEQ".nextval into :NEW."���_��������" from dual;
end;