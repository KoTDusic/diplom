CREATE or replace trigger "BI_Преподаватель"
  before insert on "Преподаватель"
  for each row
begin
  select "Преподаватель_SEQ".nextval into :NEW."Код_преподавателя" from dual;
end;