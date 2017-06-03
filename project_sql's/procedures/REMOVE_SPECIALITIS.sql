--Удаление специальности на факультете
create or replace procedure REMOVE_SPECIALITIS(
speciality_code "Специальность"."Код_специальности"%TYPE)
is
valid_speciality integer;
valid integer;
begin
if (speciality_code IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid_speciality from "Специальность" where "Код_специальности"=speciality_code;
if valid_speciality=0 then
raise_application_error(-20001,'Специальность с кодом '||speciality_code||' не найдено');
end if;
select count(*) into valid from "Специальность" where "Код_специальности" = speciality_code;
if valid<>0 then
delete from "Специальность" where "Код_специальности" = speciality_code;
else begin
  raise_application_error(-20001,'Ошибка, такой записи нет в базе');
  end;
end if;
commit;
end REMOVE_SPECIALITIS;