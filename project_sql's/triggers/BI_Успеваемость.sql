CREATE or replace trigger "BI_Успеваемость"
  before insert on "Успеваемость"
  for each row
begin
  select "Успеваемость_SEQ".nextval into :NEW."Код_записи" from dual;
end;