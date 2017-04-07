CREATE or replace trigger "BI_Нагрузка_преподавателя"
  before insert on "Нагрузка_преподавателя"
  for each row
begin
  select "Нагрузка_преподавателя_SEQ".nextval into :NEW."Код_нагрузки" from dual;
end;