create or replace function addworkingdays(
  p_days  in number, 
  p_dt    in date default trunc(sysdate)
) 
  return date
as

n          number := 0;
vp_days    number;
vp_dt      date;

begin
if p_days is null then -- WK, 06.08.2009
   vp_days := -1;
else
   vp_days := p_days-1;
end if;

if p_dt is null then   -- WK, 06.08.2009
   vp_dt := sysdate;
else
   vp_dt := p_dt;
end if;

while vp_days > 0 loop  
  if to_char(vp_dt,'D') != 6 and to_char(vp_dt,'D') != 7 then
     vp_days := vp_days-1;

     n := n+1;
     if n > 1000 then  -- WK, 06.08.2009
        return null;
     end if;
  end if;
  
  vp_dt:=vp_dt+1;
end loop;

return vp_dt;

end;
/

