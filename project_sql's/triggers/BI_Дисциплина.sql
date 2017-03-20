CREATE or replace trigger "BI_Дисциплина"
  before insert on "Дисциплина"
  for each row
begin
  select "Дисциплина_SEQ".nextval into :NEW."Код_дисциплины" from dual;
end;