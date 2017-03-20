CREATE or replace trigger "BI_Подгруппы"
  before insert on "Подгруппы"
  for each row
begin
  select "Подгруппы_SEQ".nextval into :NEW."Код_подгруппы" from dual;
end;