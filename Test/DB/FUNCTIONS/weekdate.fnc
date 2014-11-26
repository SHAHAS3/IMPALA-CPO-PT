create or replace function weekdate(vcur_year number, vcur_week number)
return date
is
vdate date;
begin
SELECT TRUNC(TO_DATE('2711'||vcur_year, 'DDMMYYYY'), 'IYYY') + (vcur_week - 1) * 7 into vdate from dual;
-- select decode(to_Char(to_date('01-JAN-'||vCur_year),'DY'),'MON',
-- to_date('01-JAN-'||vCur_year),next_day(to_date('01-JAN-'||vCur_year),'MON'))+(7*(vcur_week-1)) into vdate from dual;
return vdate;
end;
/

