create or replace function F$GETCODELISTE
(
p_codelistename varchar2,
p_code varchar2
)
return number
as
v_result number;
begin

if ( p_code  is null ) then
  v_result:= 2;
else
  select orderby 
  into v_result
  from codelist 
  where upper(codelistname) = upper(p_codelistename  )
  and code = p_code;
end if;

return v_result;

exception
when no_data_found then
  select max(orderby)
  into v_result
  from codelist
  where upper(codelistname) = upper(p_codelistename  );
  
  return v_result;

end;
/

