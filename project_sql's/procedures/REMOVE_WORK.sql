--Удаление связи преподаватель-подгруппа-дисциплина
create or replace procedure REMOVE_WORK(
kode "Нагрузка_преподавателя"."Код_нагрузки"%TYPE)
is 
valid integer;
begin
if (kode IS NULL) then
raise_application_error(-20001,'Неверные значения');
end if;
--проверка наличия записи
select count(*)into valid from "Нагрузка_преподавателя" where "Код_нагрузки" = kode;
if valid=1 then
delete "Нагрузка_преподавателя" where "Код_нагрузки"=kode;
else begin
    raise_application_error(-20001,'Ошибка, записи c кодом '||kode||' нет в базе');
  end;
end if;
commit;
end REMOVE_WORK;