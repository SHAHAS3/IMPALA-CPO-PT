create or replace procedure POPULATEPCNKEY(p_pcn in varchar2,
                         p_startdate in date,
                         p_status in varchar2,
                         p_dsmui  in varchar2) 
is
  v_count number;
  v_seq   number;
BEGIN
  if (p_pcn is not null ) then
  
    select count(*) 
    into v_count
    from capampweek
    where pcn = p_pcn
    and (startdate = p_startdate or p_startdate is null)
    and (status = p_status or p_status is null);
    
    if (v_count > 0) then
      select PCNKEY_SEQ.nextval
      into v_seq
      from dual; 
  
      update capampweek
      set pcnkey = v_seq
      where pcn = p_pcn
      and (startdate = p_startdate or p_startdate is null)
      and (status = p_status or p_status is null)
      and pcnkey is null;           
      
      commit;
    end if;
  else  
    select count(*) 
    into v_count
    from capampweek
    where dsmui = p_dsmui
    and (startdate = p_startdate or p_startdate is null)
    and (status = p_status or p_status is null);
    
    if (v_count > 0) then
      select PCNKEY_SEQ.nextval
      into v_seq
      from dual; 
  
      update capampweek
      set pcnkey = v_seq
      where dsmui = p_dsmui
      and (startdate = p_startdate or p_startdate is null)
      and (status = p_status or p_status is null)
      and pcnkey is null;           
      
      commit;
    end if;
  
  end if;
 
end POPULATEPCNKEY;
/

