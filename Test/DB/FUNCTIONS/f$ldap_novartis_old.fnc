CREATE OR REPLACE FUNCTION F$LDAP_NOVARTIS_OLD(p_NTUserID   IN  VARCHAR2,
                       p_NTPassword IN  VARCHAR2) RETURN BOOLEAN is        
   v_ldap_host     VARCHAR2(256);
   v_ldap_port     PLS_INTEGER;
   v_ldap_user     VARCHAR2(256);
   v_retval        PLS_INTEGER;
   v_my_session    DBMS_LDAP.SESSION;
BEGIN
   if ((p_NTUserID is null) or (p_NTPassword is null))then
      return false;
   end if;
   v_ldap_host    := 'chgaad.eu.novartis.net';
   v_ldap_port    := '3930';
   v_ldap_user    := 'uid='||p_NTUserID||',ou=people,ou=intranet,dc=novartis,dc=com';
   DBMS_LDAP.USE_EXCEPTION := TRUE;
   v_my_session := DBMS_LDAP.init(v_ldap_host,v_ldap_port);
   v_retval := DBMS_LDAP.simple_bind_s(v_my_session,v_ldap_user,p_NTPassword);
   v_retval := DBMS_LDAP.unbind_s(v_my_session);
   RETURN TRUE;
EXCEPTION WHEN DBMS_LDAP.general_error then
   if instr(SQLERRM, 'LDAP Error 49')>0 then
      RETURN FALSE;
   else
      raise;
   end if;
END F$LDAP_NOVARTIS_OLD;
/

