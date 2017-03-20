CREATE or replace trigger "BI_Группы"
  before insert on "Группы"
  for each row
begin
  select "Группы_SEQ".nextval into :NEW."Код_группы" from dual;
end;