create or replace function get_signee_name (v_signee varchar2)
return varchar2
is
v_signee_name varchar2(32767);
begin
select name into v_signee_name from adm_users where upper(userid) = upper(substr(v_signee,1,instr(v_signee,'#')-1)) and rownum <2;
return v_signee_name;
EXCEPTION
WHEN OTHERS THEN
 select decode(substr(v_signee,1,instr(v_signee,'#')-1),null,v_signee,substr(v_signee,1,instr(v_signee,'#')-1)) into v_signee_name from dual;
 RETURN v_signee_name;
end;
/

