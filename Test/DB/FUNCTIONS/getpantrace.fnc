create or replace function getpantrace
--  http://pantracepublic.panalpina.com/PTC/index2.jsp?searchoption=custref&reference=1180109118&searchAtStart=1
(
v_ship_typ_c varchar2,
v_stock_c varchar2,
v_term_deliv varchar2
)
return varchar2
as
vpantrace varchar2(1000);
vurl varchar2(1000);
begin
if (v_stock_c in ('VMLK','VSTL','VSTL') and upper(v_ship_typ_c) like '%AIRFREIGHT%' and v_term_deliv is not null) then
  vpantrace:= v_term_deliv;
  vurl:='http://pantracepublic.panalpina.com/PTC/index2.jsp?searchoption=custref';
  vurl:=concat(vurl,'&');
  vurl:=vurl||'reference=';
  vpantrace:=vurl||v_term_deliv;
  vpantrace:=concat(vpantrace,'&');
  vpantrace:=vpantrace||'searchAtStart=1';
else
  vpantrace:='';
end if;
return vpantrace;
end;
/

