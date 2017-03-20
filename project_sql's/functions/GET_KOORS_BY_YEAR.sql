create or replace function GET_KOORS_BY_YEAR(
age "Группы"."Год_поступления"%TYPE
)RETURN NUMBER
is
delimiter date;
begin_date date;
koors integer;
begin
delimiter:=to_date('01.08.'||to_char(sysdate,'yyyy'));
begin_date:=to_date('01.09.'||age);
koors:=trunc(abs(months_between(begin_date,delimiter))/12);
return koors;
end GET_KOORS_BY_YEAR;
