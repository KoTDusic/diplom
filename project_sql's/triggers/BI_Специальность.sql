CREATE or replace trigger "BI_Специальность"
  before insert on "Специальность"
  for each row
begin
  select "Специальность_SEQ".nextval into :NEW."Код_специальности" from dual;
end;