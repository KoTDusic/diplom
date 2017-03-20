CREATE or replace trigger "BI_Факультет"
  before insert on "Факультет"
  for each row
begin
  select "Факультет_SEQ".nextval into :NEW."Код_факультета" from dual;
end;