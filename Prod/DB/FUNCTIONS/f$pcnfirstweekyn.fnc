create or replace function F$PCNFIRSTWEEKYN
(
p_capampweekid     in     varchar2,
p_pcnkey     in     number
)
return varchar2
as
v_result varchar2(1):= 'N';
l_year number;
l_week number;
l_count number;
l_pcnkey number;
begin

if (p_pcnkey is null ) then
  return 'Y';
end if;

select count(*) 
into l_count
from  capamp
where id = (select capamp_id from capampweek where id =  p_capampweekid );

if (l_count = 0 ) then
  return 'N';
else
  select mpyear,mpweek
  into l_year,l_week
  from capamp
  where id = (select capamp_id from capampweek where id =  p_capampweekid );
end if;

if (l_week != 1)then
  select count(*)
  into l_count
  from capampweek
  where pcnkey = p_pcnkey 
  and capamp_id in (select id from capamp where mpyear = l_year and mpweek = l_week-1)
  and (status != 'SHIFTED QTY CHANGE' and status != 'SHIFTED NO QTY CHANGE' or status is null);
else  
--first calendar week, check for entries in previous year
  select count(*)
  into l_count
  from capampweek
  where pcnkey = p_pcnkey 
  and capamp_id in (select id from capamp where mpyear = l_year-1)
  and (status != 'SHIFTED QTY CHANGE' and status != 'SHIFTED NO QTY CHANGE' or status is null);
end if;  

if (l_count = 0) then
  v_result := 'Y';
end if;
  
  return v_result;

end;
/

