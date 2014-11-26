create or replace function F$LOGIN(
 p_username     in     varchar2,
 p_password     in     varchar2
)
return boolean
is

i          number;
vr         number;

vusername  varchar2(60) := upper(p_username);
vuser      varchar2(60);

begin
begin
-- C. Geyer 01-jul-10 TQW 28458: added GUSERID
select id, name, userid, aro_id
into   GLOBALVARS.GUSID, GLOBALVARS.GUSER, GLOBALVARS.GUSERID, vr
from   ADM_USERS
where  upper(userid) = vusername
  and  trunc(date_expired) >= trunc(sysdate);

exception
when no_data_found then
     return false;
end;

select abbr
into   GLOBALVARS.GROLE
from   ADM_ROLES
where  id = vr;

i := instr(vusername,'_');

if i > 0 then
   vuser := substr(vusername,i+1);
else
   vuser := vusername;
end if;

begin
   return F$LDAP_NOVARTIS(
                           p_NTUserID   => vuser,
                           p_NTPassword => p_password
                         );
   exception
   when others then
        return false;
end;

end F$LOGIN;
/

