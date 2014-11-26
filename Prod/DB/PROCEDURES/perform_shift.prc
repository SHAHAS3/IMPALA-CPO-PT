create or replace procedure perform_shift(
p_capampweekid     in     varchar2,
p_startdate        in     date,
p_quantitychangeyn in varchar2
)
is

l_startdate                     date;
l_orderfinished                 varchar2(3);
l_pcn                           varchar2(50);
l_description                   varchar2(100);
l_comment200                    varchar2(200);
l_status                        varchar2(100);
l_assignedhoursperorde          number;
l_numberofpeople                number;
l_numberofclinicopialabels      number;
l_numberofclintraklabels        number;
l_numberofseallabels            number;
l_numberofbatches               number;
l_fillcounts                    number;
l_week                          number;
l_year                          number;
l_count                         number;
l_count2                        number;
l_capamp_id                     number;
l_sitecode                      varchar2(2);
l_weekday                       varchar2(20);
l_newweekday                    varchar2(20);
l_dsmui                         varchar2(200);
l_id                            number;
l_count3                        number;
l_pcnkey                        number;
begin

select startdate 
into l_startdate
from capampweek
where id = p_capampweekid;

if (l_startdate != p_startdate and p_capampweekid is not null  ) then
  --copy current capampweek data
  select 
     orderfinished,
     pcn,
     description,
     comment200,
     status,
     assignedhoursperorde,
     numberofpeople,
     numberofclinicopialabels,
     numberofclintraklabels,
     numberofseallabels,
     numberofbatches,
     fillcounts ,
     weekday,
     dsmui,
     pcnkey,
     capamp_id
  into 
     l_orderfinished,
     l_pcn,
     l_description,
     l_comment200,
     l_status,
     l_assignedhoursperorde,
     l_numberofpeople,
     l_numberofclinicopialabels,
     l_numberofclintraklabels,
     l_numberofseallabels,
     l_numberofbatches,
     l_fillcounts ,
     l_weekday,
     l_dsmui,
     l_pcnkey,
     l_capamp_id
  from capampweek
  where id = p_capampweekid;
  
  --set the status of current record to shifted
  --and set needed data to null
   
  if (p_quantitychangeyn = 'Y') then 
    update capampweek
    set
      assignedhoursperorde = null,
      assignedhoursperweek = null,
      numberofpeople = null,
      enddate = null,
      status = 'SHIFTED QTY CHANGE',
      actualhoursperorder = null,
      numberofclinicopialabels = null,
      numberofclintraklabels = null,
      numberofseallabels = null,
      numberofbatches = null,
      fillcounts = null,
      weekday = null,
      dsmui = null
     where id = p_capampweekid; 
     
  else
    update capampweek
    set
      assignedhoursperorde = null,
      assignedhoursperweek = null,
      numberofpeople = null,
      enddate = null,
      status = 'SHIFTED NO QTY CHANGE',
      actualhoursperorder = null,
      numberofclinicopialabels = null,
      numberofclintraklabels = null,
      numberofseallabels = null,
      numberofbatches = null,
      fillcounts = null
     where id = p_capampweekid;
  end if;
  
  capampbilance(l_capamp_id);
  sumoflabels(l_capamp_id);

  
  --delete week entries for the PCN to be shiffted
  delete capampweek
  where pcnkey = l_pcnkey
  and id != p_capampweekid;
  
  ----insert the shifted entry for the corresponding PCN
  --get the Week and Year of the shiftt date
  --get the sitecode
  select to_char(to_date(p_startdate), 'IW') 
  into l_week 
  from dual;

  select to_char(to_date(p_startdate), 'IYYY') 
  into l_year
  from dual;
  
  select sitecode
  into l_sitecode
  from capamp 
  where id = (select capamp_id from capampweek where id = p_capampweekid);
  
    
  --check if the capamp entry already exists, else create it
  select count(*) 
  into l_count
  from capamp
  where mpweek = l_week
  and mpyear = l_year
  and sitecode = nvl(l_sitecode,'CH');
    
  l_capamp_id := 0;
  if (l_count = 0) then
      -- week record does not exist, insert week
      --should not happen because entries loaded for next 5 years
       SELECT idseq.nextval INTO l_capamp_id FROM dual;
      -- insert week record
       INSERT
         INTO capamp
        ( 
           id,
           mpweek,
           mpyear,
           sitecode
        )
        VALUES
        (
          l_capamp_id,
          l_week ,
          l_year  ,
          nvl(l_sitecode,'CH')
        );
  end if;
  
  --new entry for the shifted capampweek
  --get the capamp id
  select id into l_capamp_id
  from capamp
  where mpweek = l_week
  and mpyear = l_year
  and sitecode = nvl(l_sitecode,'CH');
  
  --if one of the subsequent shift is 
  --done to the initial shift
  --delete the previous entry and re-create the shifted one
  select count(*) 
  into l_count2
  from capampweek
  where pcn = l_pcn
  --and startdate = p_startdate
  and capamp_id = l_capamp_id
  and status in ( 'SHIFTED QTY CHANGE','SHIFTED NO QTY CHANGE');
  
    
  if (l_count2 > 0) then
    delete capampweek
    where pcn = l_pcn
    --and startdate = p_startdate
    and capamp_id = l_capamp_id
    and status in ( 'SHIFTED QTY CHANGE','SHIFTED NO QTY CHANGE'); 
  end if;
  
  select decode(to_char(p_startdate,'D'),1,'SUNDAY',2,'MONDAY',3,'TUESDAY',4,'WEDNESDAY',5,'THURSDAY',6,'FRIDAY',7,'SATURDAY')
  into l_newweekday
  from dual;

  select count(*)
  into l_count3
  from capampweek
  where pcn = l_pcn
  and startdate = p_startdate;
  
  if (l_count3 >0) then
    delete capampweek
    where pcn = l_pcn
    and startdate = p_startdate;  
  end if;
  
  select idseq.nextval into l_id from dual;
  if (p_quantitychangeyn = 'Y') then  
    INSERT
    INTO capampweek
    (
       id                      ,
       CAPAMP_ID               ,
       PCN                     ,
       DESCRIPTION             ,
       ASSIGNEDHOURSPERORDE    ,
       STATUS                  ,
       STARTDATE               ,
       NUMBEROFBATCHES         ,
       FILLCOUNTS              ,
       NUMBEROFPEOPLE          ,
       ORDERFINISHED           ,
       COMMENT200              ,
       WEEKDAY                 ,
       DSMUI
    )
    VALUES
    (
       l_id            ,
       l_capamp_id              ,
       l_pcn                    ,
       l_description            ,
       --l_assignedhoursperorde ,
       ''                       ,
       --l_status               ,
       ''                       ,
       p_startdate              ,
       l_numberofbatches        ,
       l_fillcounts             ,
       --l_numberofpeople       ,
       ''                       ,
       l_orderfinished          ,
       l_comment200             ,
       l_newweekday                ,
       l_dsmui
  );
  else
    INSERT
    INTO capampweek
    (
       id                      ,
       CAPAMP_ID               ,
       PCN                     ,
       DESCRIPTION             ,
       ASSIGNEDHOURSPERORDE    ,
       STATUS                  ,
       STARTDATE               ,
       NUMBEROFBATCHES         ,
       FILLCOUNTS              ,
       NUMBEROFPEOPLE          ,
       ORDERFINISHED           ,
       COMMENT200              ,
       NUMBEROFCLINICOPIALABELS,
       NUMBEROFCLINTRAKLABELS  ,
       NUMBEROFSEALLABELS      ,
       WEEKDAY                 ,
       DSMUI
    )
    VALUES
    (
       l_id                     ,
       l_capamp_id              ,
       l_pcn                    ,
       l_description            ,
       l_assignedhoursperorde   ,
       --l_status               ,
       ''                       ,
       p_startdate              ,
       l_numberofbatches        ,
       l_fillcounts             ,
       l_numberofpeople         ,
       l_orderfinished          ,
       l_comment200             ,
       l_numberofclinicopialabels,
       l_numberofclintraklabels  ,
       l_numberofseallabels      ,
       l_newweekday              ,
       l_dsmui
  );  
  end if;
  commit; 
else     --no shift to be done because shift date equals previous startdate
  return;
end if;



--ASSGNWEEKHOURS(l_id); 

calcenddate(l_capamp_id);

PCNUPDATE  (l_capamp_id);

--capampbilance(l_capamp_id);

sumoflabels (l_capamp_id);

exception
when others then
  raise_application_error (-20001,'Error in SHIFT, please contact IT');
  rollback;
end;
/

