create or replace function get_audit_trail_ref(v_id number,v_column varchar2)
return VARCHAR2
is
v_ref varchar2(100);
begin

select pcn 
into v_ref
from capampweek
where id = v_id;

return v_ref;

exception
when no_data_found then
   return null;

end;
/

