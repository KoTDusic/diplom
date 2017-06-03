--Добавление группы
create or replace procedure ADD_GROUP(
speciality_code "Группы"."Код_специальности"%TYPE,
age "Группы"."Год_поступления"%TYPE,
group_number "Группы"."Номер_группы"%TYPE)
is
valid integer;
begin
if (speciality_code IS NULL OR age IS NULL OR group_number IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
select count(*) into valid from "Группы" 
where "Группы"."Код_специальности"=speciality_code AND
"Группы"."Год_поступления" = age AND
"Группы"."Номер_группы" = group_number;
if valid=0 then

INSERT INTO "Группы"("Код_специальности","Год_поступления","Номер_группы")
VALUES (speciality_code, age, group_number);

else begin
  raise_application_error(-20001,'Ошибка, такая запись уже есть');
  end;
end if;
commit;
end ADD_GROUP;