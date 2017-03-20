CREATE or replace trigger "BI_Студенты"
  before insert on "Студенты"
  for each row
begin
  select "Студенты_SEQ".nextval into :NEW."Код_студента" from dual;
end;