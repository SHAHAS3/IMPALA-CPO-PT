create or replace procedure updatestartdate(
--startdate updated after change of the day in the week
p_capampweekid     in     varchar2,
p_startdate        in     date,
p_weekday         in varchar2,
p_pcn varchar2,
p_pcnkey number,
p_assignedhoursperorde  number,
p_numberofpeople         number
)
is

l_startdate   date;
l_year        number;
l_week        number;
l_minweek    number;
l_minyear    number;
l_pcn capampweek.pcn%type;
l_count number;
l_weekdaybefore varchar2(50);
l_weekdayafter varchar2(50);
l_numberofpeople number;
l_assignedhoursperorde number;



begin

if (F$PCNFIRSTWEEKYN(p_capampweekid,p_pcnkey) = 'N') then


  select weekday
  into l_weekdaybefore
  from capampweek 
  where id = p_capampweekid;
  
  select numberofpeople ,assignedhoursperorde
  into l_numberofpeople , l_assignedhoursperorde
  from capampweek 
  where pcnkey = p_pcnkey 
  and rownum =1 
  and id = (select min(id) from capampweek where pcnkey = p_pcnkey);
  
  --reset value for start day  
  update capampweek
  set weekday = decode(to_char(p_startdate,'D'),1,'SUNDAY',2,'MONDAY',3,'TUESDAY',4,'WEDNESDAY',
  5,'THURSDAY',6,'FRIDAY',7,'SATURDAY'),
  numberofpeople = l_numberofpeople,
  assignedhoursperorde = l_assignedhoursperorde
  where id = p_capampweekid;
  
  commit;  

  select weekday
  into l_weekdayafter
  from capampweek 
  where id = p_capampweekid;

  CAPAMPWEEKUPDATE(p_capampweekid);


  --RAISE_APPLICATION_ERROR(-20000, 'Please change order values in order initial week entry');  
  if (l_weekdaybefore != l_weekdayafter or p_assignedhoursperorde != l_assignedhoursperorde or p_numberofpeople != l_numberofpeople or
     (l_weekdaybefore is not null and l_weekdayafter is null) or (l_weekdaybefore is null and l_weekdayafter is not null)   or 
     (p_assignedhoursperorde is null and l_assignedhoursperorde is not null) or (p_assignedhoursperorde is not null and l_assignedhoursperorde is null) or
     (p_numberofpeople is null and l_numberofpeople is not null) or (p_numberofpeople is not null and l_numberofpeople is null )) then
    RAISE_APPLICATION_ERROR(-20000, 'Please change ''start date'' , ''planned hours per order'' or ''number of people'' in order initial week entry');  
  end if;  
  return;
else  


select mpyear,mpweek
into l_year,l_week
from capamp
where id = (select capamp_id from capampweek where id =  p_capampweekid );


select to_char(weekdate(l_year,l_week))
into l_startdate
from dual;


case upper(p_weekday)
when 'MONDAY' then
  update capampweek
  set startdate = l_startdate,
  weekday = p_weekday
  where pcnkey = p_pcnkey;
  --where id = p_capampweekid;  
when 'TUESDAY' then
  update capampweek
  set startdate = l_startdate + 1d,
  weekday = p_weekday
  where pcnkey = p_pcnkey;
  --where id = p_capampweekid;  
when 'WEDNESDAY' then
  update capampweek
  set startdate = l_startdate + 2d,
  weekday = p_weekday
  where pcnkey = p_pcnkey;
  --where id = p_capampweekid; 
when 'THURSDAY' then
  update capampweek
  set startdate = l_startdate + 3d,
  weekday = p_weekday
  where pcnkey = p_pcnkey;
  --where id = p_capampweekid; 
when 'FRIDAY' then
  update capampweek
  set startdate = l_startdate + 4d,
  weekday = p_weekday
  where pcnkey = p_pcnkey;
  --where id = p_capampweekid; 
end case;

commit;
  
end if;




end;
/

