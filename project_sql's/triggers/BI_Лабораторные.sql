CREATE or replace trigger "BI_Лабораторные"
  before insert on "Лабораторные"
  for each row
begin
  select "Лабораторные_SEQ".nextval into :NEW."Код_лабораторной" from dual;
end;