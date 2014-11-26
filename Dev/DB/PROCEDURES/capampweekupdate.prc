create or replace procedure capampweekupdate(
p_capampweekid     in     varchar2
)
is

l_orderfinished capampweek.orderfinished%type ;
l_dsmui capampweek.dsmui%type ;
l_pcn capampweek.pcn%type ;
l_description capampweek.description%type ;
l_comment200 capampweek.comment200%type ;
l_status capampweek.status%type ;
l_actualhoursperorder capampweek.actualhoursperorder%type ;
l_numberofclinicopialabels capampweek.numberofclinicopialabels%type ;
l_numberofclintraklabels capampweek.numberofclintraklabels%type ;
l_numberofseallabels capampweek.numberofseallabels%type ;
l_startdate capampweek.startdate%type ;
l_enddate capampweek.enddate%type ;
l_enddate2 capampweek.enddate%type ;
l_capampid capampweek.capamp_id%type ;
l_count number;
l_year number;
l_week number;
l_pcnkey number;

begin



select description,pcn,orderfinished,dsmui,comment200,status,actualhoursperorder,
numberofclinicopialabels,numberofclintraklabels,numberofseallabels,startdate,enddate,capamp_id,pcnkey
into l_description,l_pcn,l_orderfinished,l_dsmui,l_comment200,l_status,l_actualhoursperorder,
l_numberofclinicopialabels,l_numberofclintraklabels,l_numberofseallabels,l_startdate,l_enddate,l_capampid,l_pcnkey
from capampweek
where id = p_capampweekid
and rownum = 1;

if (F$PCNFIRSTWEEKYN(p_capampweekid,l_pcnkey) = 'N') then
  update capampweek
  set orderfinished = l_orderfinished,
  dsmui = l_dsmui,
  description = l_description,
  comment200 = l_comment200,
  status  = l_status,
  --actualhoursperorder = l_actualhoursperorder,
  --numberofclinicopialabels = l_numberofclinicopialabels,
  --numberofclintraklabels = l_numberofclintraklabels,
  --numberofseallabels = l_numberofseallabels,
  pcn = l_pcn,
  enddate = l_enddate
  where pcnkey = l_pcnkey;
else
  update capampweek
  set orderfinished = l_orderfinished,
  dsmui = l_dsmui,
  description = l_description,
  comment200 = l_comment200,
  status  = l_status,
  actualhoursperorder = l_actualhoursperorder,
  numberofclinicopialabels = l_numberofclinicopialabels,
  numberofclintraklabels = l_numberofclintraklabels,
  numberofseallabels = l_numberofseallabels,
  pcn = l_pcn
  where pcnkey = l_pcnkey;
end if;


commit;


end;
/

