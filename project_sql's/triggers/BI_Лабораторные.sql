CREATE or replace trigger "BI_������������"
  before insert on "������������"
  for each row
begin
  select "������������_SEQ".nextval into :NEW."���_������������" from dual;
end;