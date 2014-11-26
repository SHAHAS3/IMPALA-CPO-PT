create or replace procedure P$MOVESITECODE (
p_newsitecode varchar2,
p_capampid number , 
p_capampweekid number) 
is
v_capampidiv number;
v_mpweek     number;
v_mpyear     number;
v_count      number;
v_pcnkey     number;

begin

select mpweek,mpyear
into v_mpweek,v_mpyear
from capamp
where id = p_capampid;

select count(*)
into v_count
from capamp
where mpweek = v_mpweek
and mpyear = v_mpyear
and sitecode = p_newsitecode ;

if (v_count > 0 ) then
  --get capamp_id for Iverslee
  select id
  into v_capampidiv
  from capamp
  where mpweek = v_mpweek
  and mpyear = v_mpyear
  and sitecode = p_newsitecode ;
  
  select pcnkey
  into v_pcnkey
  from capampweek
  where id = p_capampweekid;
  
  update capampweek
  set capamp_id = v_capampidiv
  where id = p_capampweekid;
  
  commit;
  
  capampbilance(p_capampid);
  capampbilance(v_capampidiv);
  sumoflabels(p_capampid);
  sumoflabels(v_capampidiv);  
  
  --move to other stocks for pcn entered in other weeks
  for cx in (
             select id,capamp_id
             from   CAPAMPWEEK
             where  pcnkey = v_pcnkey 
             and id != p_capampweekid
                      )
            loop
              select mpweek,mpyear
              into v_mpweek,v_mpyear
              from capamp
              where id = cx.capamp_id;     

              select count(*)
              into v_count
              from capamp
              where mpweek = v_mpweek
              and mpyear = v_mpyear
              and sitecode = p_newsitecode ;              
              
              
              if (v_count > 0 ) then
                --get capamp_id for Iverslee
                select id
                into v_capampidiv
                from capamp
                where mpweek = v_mpweek
                and mpyear = v_mpyear
                and sitecode = p_newsitecode ;
  
                update capampweek
                set capamp_id = v_capampidiv
                where id = cx.id
                and pcnkey = v_pcnkey;
               
                commit;
                capampbilance(v_capampidiv);
                capampbilance(cx.capamp_id);
                sumoflabels(v_capampidiv);
                sumoflabels(cx.capamp_id);
              end if;       
            end loop;   
  
else
  return;
end if;

     
end;
/

